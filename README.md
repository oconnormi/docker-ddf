# Docker DDF
DDF in a container

[![](https://imagelayers.io/badge/oconnormi/ddf:latest.svg)](https://imagelayers.io/?images=oconnormi/ddf:latest 'Get your own badge on imagelayers.io')
[![license](https://img.shields.io/github/license/oconnormi/docker-ddf.svg?maxAge=2592000?style=flat-square)](https://github.com/oconnormi/docker-ddf/blob/master/LICENSE)

## What is DDF?
See the [ddf homepage](http://codice.org/ddf/)

## Usage

To start a basic default DDF instance

```
docker run -name some-ddf -d oconnormi/ddf
```

To expose the ddf ui:

```
docker run -name some-ddf -d -p 8993:8993 oconnormi/ddf
```
