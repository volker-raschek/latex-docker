# Latex

[![Docker Pulls](https://img.shields.io/docker/pulls/volkerraschek/latex)](https://hub.docker.com/r/volkerraschek/latex)

The repository, hosted on [git.cryptic.systems](https://git.cryptic.systems/volker.raschek/latex-docker), contains
Dockerfiles to build container images based on different base images. Any container image has the tex compiler and the
minted package included. The main goal of all container image is to compile the text source code with highlighting
provided by minted into a PDF file.

## Images

Available Images:

- `docker.io/volkerraschek/latex:latest-archlinux`

You can find a complete list of all docker images based on different distributions on [Docker
Hub](https://hub.docker.com/r/volkerraschek/latex-docker/tags).

## Usage

### Latexmk

Here is an example based on ubuntu 18.04 to compile a PDF file with `latexmk` from `index.tex`. Run this command in your
root directory of your Latex files or change the `volume` option with the `${PWD}` variable.

```bash
$ docker run \
    --rm \
    --user="$(shell id -u):$(shell id -g)" \
    --net="none" \
    --volume="${PWD}:/workspace" volkerraschek/latex:latest-archlinux \
    latexmk \
      -shell-escape \
      -synctex=1 \
      -interaction=nonstopmode \
      -file-line-error \
      -pdf index.tex
```

### pdflatex

Here is a example based on ubuntu 18.04 to compile a PDF file with `pdflatex` from `index.tex`.  Run this command in
your root directory of your Latex files or change the `volume` option with the `${PWD}` variable.

```bash
$ docker run \
    --rm \
    --user="$(shell id -u):$(shell id -g)" \
    --net="none" \
    --volume="${PWD}:/workspace" volkerraschek/latex:latest-archlinux \
    pdflatex \
      -shell-escape \
      -synctex=1 \
      -interaction=nonstopmode \
      -enable-write18 index.tex
```
