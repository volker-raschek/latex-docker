# Docker Latex

[![Docker Pulls](https://img.shields.io/docker/pulls/volkerraschek/latex)](https://hub.docker.com/r/volkerraschek/latex)

This repository, hosted on
[git.cryptic.systems](https://git.cryptic.systems/volker.raschek/latex-docker),
contains Dockerfiles to build different container images based on differend base
images. Any container image has the tex compiler and the minted package
included. Throught this are all container images able to compile tex source code
with source code highlighting.

## Images

Available Images:

- volkerraschek/latex:latest-archlinux
- volkerraschek/latex:latest-debian8-slim
- volkerraschek/latex:latest-debian9-slim
- volkerraschek/latex:latest-debian10-slim
- volkerraschek/latex:latest-fedora-30
- volkerraschek/latex:latest-fedora-31
- volkerraschek/latex:latest-centos-7
- volkerraschek/latex:latest-ubuntu-16.04
- volkerraschek/latex:latest-ubuntu-18.04
- volkerraschek/latex:latest-ubuntu-20.04

You can find a complete list of all docker images based on different
distributions on [Docker Hub](https://hub.docker.com/r/volkerraschek/latex-docker/tags).

## Usage

### Latexmk

Here is an example based on ubuntu 18.04 to compile a PDF file with `latexmk`
from `index.tex`. Run this command in your root directory of your Latex files or
change the `volume` option with the `${PWD}` variable.

```bash
$ docker run \
    --rm \
    --user="$(shell id -u):$(shell id -g)" \
    --net="none" \
    --volume="${PWD}:/workspace" volkerraschek/latex:latest-ubuntu-18.04 \
    latexmk \
      -shell-escape \
      -synctex=1 \
      -interaction=nonstopmode \
      -file-line-error \
      -pdf index.tex
```

### pdflatex

Here is a example based on ubuntu 18.04 to compile a PDF file with `pdflatex`
from `index.tex`.  Run this command in your root directory of your Latex files
or change the `volume` option with the `${PWD}` variable.

```bash
$ docker run \
    --rm \
    --user="$(shell id -u):$(shell id -g)" \
    --net="none" \
    --volume="${PWD}:/workspace" volkerraschek/latex:latest-ubuntu-18.04 \
    pdflatex \
      -shell-escape \
      -synctex=1 \
      -interaction=nonstopmode \
      -enable-write18 index.tex
```
