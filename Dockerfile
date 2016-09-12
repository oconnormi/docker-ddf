FROM anapsix/alpine-java:jdk

ARG version=2.9.2

ENV DDF_VERSION=${version}
ENV DDF_BASE="/opt/ddf"
ENV DDF_HOME=$DDF_BASE/ddf-$DDF_VERSION

RUN apk add --no-cache curl unzip

RUN mkdir -p $DDF_BASE \
    && cd $DDF_BASE \
    && curl -o ddf.zip "http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.ddf&a=ddf&v=$DDF_VERSION&r=releases&e=zip" \
    && unzip ddf.zip \
    && rm -rf ddf.zip

VOLUME $DDF_HOME/data $DDF_HOME/deploy $DDF_HOME/etc

EXPOSE 8101 8993 8181

ENTRYPOINT ["/bin/bash", "-c", "$DDF_HOME/bin/ddf"]
