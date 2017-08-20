# Docker DDF
DDF in a container

[![Docker Automated build](https://img.shields.io/docker/automated/oconnormi/ddf.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/oconnormi/ddf/)

[![](https://imagelayers.io/badge/oconnormi/ddf:latest.svg)](https://imagelayers.io/?images=oconnormi/ddf:latest 'Get your own badge on imagelayers.io')

[![license](https://img.shields.io/github/license/oconnormi/docker-ddf.svg?maxAge=2592000?style=flat-square)](https://github.com/oconnormi/docker-ddf/blob/master/LICENSE)

[![Waffle.io](https://img.shields.io/waffle/label/oconnormi/docker-ddf/ready.svg?maxAge=2592000?style=flat-square)](https://waffle.io/oconnormi/docker-ddf)

[![Waffle.io](https://img.shields.io/waffle/label/oconnormi/docker-ddf/in%20progress.svg?maxAge=2592000?style=flat-square)](https://waffle.io/oconnormi/docker-ddf)

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

## Persistence

To persist data/configurations mount either a volume container or a local folder to `/opt/ddf/data`

## Configuration

To configure the system mount a volume container or local folder to `/opt/ddf/etc`

## Deploying bundles

To deploy bundles that are not packaged with the DDF distribution mount a volume container or local folder to `/opt/ddf/deploy`

## Customizing Setup

Currently this container provides a custom entrypoint that has two hooks for pre-start and post start configuration.

To apply custom configuration steps before startup, mount a script via docker volumes to `/opt/entrypoint/pre_start.sh`

To apply custom configuration steps after startup, mount a script via docker volumes to `/opt/entrypoint/post_start.sh`

### Exposed Ports

|Port|Purpose        |
|:--:|:-------------:|
|8101| DDF SSH server|
|8181| http          |
|8993| https         |
