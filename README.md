# Folding@Home

![Docker](https://github.com/TheCulliganMan/folding-at-home/workflows/Docker/badge.svg)

Docker GPU (opencl/cuda) container for running [Folding@Home](http://folding.stanford.edu/)

The Makefile helps to inprove quality of life.  It has simplified command sets to view logs and such.

The repo is packaged and available at:

```bash
docker pull theculliganman/folding-at-home
```

### Usage

#### To Run 
```bash
# Normal
make run
# different username and team
make run USER_NAME=foobar TEAM=0
```
#### To View Logs
```bash
make stop
```
#### To Stop
```bash
make stop
```

The web console is available on port `7396`.
