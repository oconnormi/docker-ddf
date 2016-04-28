# Docker DDF
DDF in a container

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
