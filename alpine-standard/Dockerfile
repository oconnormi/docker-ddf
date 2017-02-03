FROM oconnormi/ddf-base:edge
MAINTAINER oconnormi

ENV APP_VERSION=2.10.0-SNAPSHOT
ENV APP_BASE=/opt
ENV APP_HOME=$APP_BASE/ddf
ENV APP_LOG=$APP_HOME/data/log/ddf.log

RUN apk add --no-cache curl unzip

RUN mkdir -p $APP_BASE/tmp \
    && mkdir -p $APP_HOME \
    && cd $APP_BASE/tmp \
    && curl -o ddf.zip "http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.ddf&a=ddf&v=$APP_VERSION&r=snapshots&e=zip" \
    && unzip ddf.zip \
    && mv ddf-${APP_VERSION}/* $APP_HOME \
    && rm -rf $APP_BASE/tmp

VOLUME $APP_HOME/data $APP_HOME/deploy $APP_HOME/etc

EXPOSE 8101 8993 8181
