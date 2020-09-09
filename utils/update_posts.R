require(stringr)
require(magrittr)
require(future)
require(furrr)
require(purrr)
require(data.table)

posts <- c("_posts/global" , list.dirs("_posts/national", recursive = FALSE))



## Copy in bib file for references
purrr::walk(posts, ~ file.copy("library.bib", file.path(.), overwrite = TRUE))


## Set up processing
future::plan("multisession")

## Make rendering safe to errors
safe_render <- purrr::safely(rmarkdown::render)


## Render by path
render_by_path <-  function(post) {
  post_name <- stringr::str_split(post, "/")[[1]] %>% 
    dplyr::last()
  tmp <- safe_render(file.path(post, paste0(post_name, ".Rmd")), quiet = FALSE)
  if (!is.null(tmp[[2]])) {
    warning(post_name, ": ", tmp[[2]])
  }
  return(tmp)
}

## Render posts in parallel
failed_to_render <- furrr::future_map(posts, render_by_path, .progress = TRUE)
failed_to_render <- purrr::transpose(failed_to_render)

## Try to render failed posts again (in serial)
secondary_render_failure <- purrr::map(posts[purrr::map_lgl(failed_to_render[[2]], ~ !is.null(.))],
                                       render_by_path)

## Manipulate errors and store in a nice format
secondary_render_failure <- purrr::transpose(secondary_render_failure)
secondary_render_failure <- secondary_render_failure[[2]]
secondary_render_failure_cmp <- purrr::compact(secondary_render_failure)
secondary_render_failure_cmp <- as.character(secondary_render_failure_cmp)
tmp <- posts[purrr::map_lgl(failed_to_render[[2]], ~ !is.null(.))]
names(secondary_render_failure_cmp) <- tmp[purrr::map_lgl(secondary_render_failure, ~ !is.null(.))]

render_failure <- data.table::data.table(page = names(secondary_render_failure_cmp), 
                                         error = secondary_render_failure_cmp)
## Save errors
data.table::fwrite(render_failure, here::here("logs", "render_failure.csv"))


## Print to terminal the failed renders
print(render_failure)

## Copy library into root to check for issues
file.copy("_posts/global/library.bib", ".", overwrite = FALSE)


## Clean up an misplaced html files
file.remove(list.files()[grep("*.html", list.files())])

