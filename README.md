
# Temporal variation in transmission during the COVID-19 outbreak

For the underlying estimates see [here](https://github.com/epiforecasts/covid-rt-estimates). See [here](https://github.com/epiforecasts/EpiNow2) for documentation on the methodology used. See [here](https://github.com/epiforecasts/covidregionaldata) for our data back-end. 

## Usage

### Clone the website

```bash
git clone --depth 1 https://github.com/epiforecasts/covid.git
```

### Update results

This repository uses Azure blob storage to store results. To download these first install [`azcopy`](https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10) (see here for a script to do this for [Linux](https://github.com/epiforecasts/covid-rt-estimates/blob/master/bin/install_azcopy.sh)) and then run the following.


```bash
Rscript utils/update_estimates.R
```

*Warning when run for the first time this will download several GB of data. See [`covid-rt-estimates`](https://github.com/epiforecasts/covid-rt-estimates) for further support accessing estimates.*

### Update the website

#### Update

Update the website with the following:

```bash
bash bin/update_website.sh
```

See the `bin` folder for other updating scripts.

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
