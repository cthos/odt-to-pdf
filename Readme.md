# ODT To PDF converter

This repo provides a Dockerfile to build out a container in order to watch a folder for changes to .odt files and automatically convert them to pdf files.

# Installation

Make sure you have docker installed and running, then build the container with the following:

```ps
docker build -t cthos/db-pdf .
```

# Usage

```sh
./run /path/to/local/folder
```

That will kick off a docker container (detached) that watches the given folder.