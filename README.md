# Dockerized DDF

[![Stories in Ready](https://badge.waffle.io/oconnormi/docker-ddf.svg?label=ready&title=Ready)](http://waffle.io/oconnormi/docker-ddf)

[![license](https://img.shields.io/github/license/oconnormi/docker-ddf.svg?maxAge=2592000?style=flat-square)](https://github.com/oconnormi/docker-ddf/blob/master/LICENSE)

## What is DDF?
See the [ddf homepage](http://codice.org/ddf/)

## Basic Usage

To start a basic default DDF instance

```
docker run -name some-ddf -d oconnormi/ddf
```

To expose the ddf ui:

```
docker run -name some-ddf -d -p 8993:8993 oconnormi/ddf
```

### Persistence

To persist data/configurations mount either a volume container or a local folder to `/opt/ddf/data`

### Configuration

To configure the system mount a volume container or local folder to `/opt/ddf/etc`

### Deploying bundles

To deploy bundles that are not packaged with the DDF distribution mount a volume container or local folder to `/opt/ddf/deploy`

### Customizing Setup

Currently this container provides a custom entrypoint that has two hooks for pre-start and post start configuration.

To apply custom configuration steps before startup, mount a script via docker volumes to `/opt/entrypoint/pre_start.sh`

To apply custom configuration steps after startup, mount a script via docker volumes to `/opt/entrypoint/post_start.sh`

### Exposed Ports

|Port|Purpose        |
|:--:|:-------------:|
|8101| DDF SSH server|
|8181| http          |
|8993| https         |

## Advanced Usage

For advanced usage see: [ddf-base](https://github.com/oconnormi/docker-ddf-base/blob/master/README.md)
