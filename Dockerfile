FROM  docker.pkg.github.com/epiforecasts/epinow2/epinow2:latest


RUN apt-get update -y && \
    apt-get install -y \
    libudunits2-dev \
    libgdal-dev \
    libqpdf-dev \
    libmagick++-dev \
    && apt-get clean

## Copy files to working directory of server
ADD DESCRIPTION /home/rstudio/

## set work location ready for running the rscript from within the home directory (where the DESCRIPTION file resides)
WORKDIR /home/rstudio

## Install missing packages
RUN Rscript -e "devtools::install_dev_deps()"
