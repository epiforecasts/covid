#!bin/bash

printf "Targetting files in following subdirectories: $1"

if ! command -v azcopy
then
    printf("Installing azcopy")
    #Download AzCopy
    wget https://aka.ms/downloadazcopy-v10-linux
    #Expand Archive
    tar -xvf downloadazcopy-v10-linux
    #Move AzCopy to the destination you want to store it
    sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/
    #Clean up
    rm -r -f downloadazcopy-v10-linux
    exit
else
    printf("Installation of azcopy detected")
fi

printf "Getting list of target files from blob storage\n"
azcopy list 'https://epinowcovidrstorage.blob.core.windows.net/results/' | grep "/$1/" > blob_files

