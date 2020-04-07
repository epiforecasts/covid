
# Temporal variation in transmission during the COVID-19 outbreak

*Warning: This analysis is a work in progress. Breaking changes may occur and the authors cannot guarantee support.*


## Usage

### Clone the website

This repository uses submodules to store results. To download these at the same time as cloning the main repository use the following:

```bash
git clone --recursive https://github.com/epiforecasts/covid.git
```

### Update external results

Update all external results using the following git call.

```bash
git submodule update --init --recursive
```

### Update the website

#### Update

Update all nowcasts and deploy the website with the following:

```bash
bash bin/update_website.sh
```

## Docker

This analysis was developed in a docker container based on the `rocker/geospatial` docker image.

To build the docker image run (from the `covid` directory):

```bash
docker build . -t covid
```

To run the docker image run:

```bash
docker run -d -p 8787:8787 --name covid -e USER=covid -e PASSWORD=covid covid
```

The RStudio client can be found on port :8787 at your local machines ip. The default username:password is time_vary:time_vary, set the user with -e USER=username, and the password with - e PASSWORD=newpasswordhere. The default is to save the analysis files into the user directory.

To mount a folder (from your current working directory - here assumed to be `tmp`) in the docker container to your local system use the following in the above docker run command (as given mounts the whole `covid` directory to `tmp`).

```{bash, eval = FALSE}
--mount type=bind,source=$(pwd)/tmp,target=/home/covid
```

To access the command line run the following:

```{bash, eval = FALSE}
docker exec -ti covid bash
```
