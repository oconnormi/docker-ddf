FROM anapsix/alpine-java:jdk
MAINTAINER oconnormi

ENV APP_VERSION=2.9.2
ENV APP_BASE=/opt
ENV APP_HOME=$APP_BASE/ddf
ENV ENTRYPOINT_HOME=/opt/entrypoint

RUN apk add --no-cache curl unzip

RUN mkdir -p $APP_BASE/tmp \
    && mkdir -p $APP_HOME \
    && cd $APP_BASE/tmp \
    && curl -o ddf.zip "http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.ddf&a=ddf&v=$APP_VERSION&r=releases&e=zip" \
    && unzip ddf.zip \
    && mv ddf-${APP_VERSION}/* $APP_HOME \
    && rm -rf $APP_BASE/tmp \
    && mkdir -p $ENTRYPOINT_HOME

COPY entrypoint/* $ENTRYPOINT_HOME/

VOLUME $APP_HOME/data $APP_HOME/deploy $APP_HOME/etc

EXPOSE 8101 8993 8181

ENTRYPOINT ["/bin/bash", "-c", "$ENTRYPOINT_HOME/entrypoint.sh"]
