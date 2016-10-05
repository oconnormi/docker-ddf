# Build command
#   Syntax:
#     docker build -t <tag> --build-arg version=<version> [--build-arg repo=<releases|snapshots>] [--build-arg hostname=<hostname>] [--build-arg siteName=<sitename>] .
#   Example:
#     docker build -t ddf/solr:2.10.0-SNAPSHOT --build-arg version=2.10.0-SNAPSHOT --build-arg repo=snapshots --build-arg hostname=solr --build-arg siteName=solr .
#
# Run command:
#   Syntax:
#     docker run -it -h <hostname> --name <container name> ddf/solr:<version>
#   Notes:
#     Image exposes ports 8101, 8181 and 8993
#   Example:
#     docker run -itP -h solr --name solr ddf/solr:2.10.0-SNAPSHOT
#     docker run -it -h solr -p 8993:8993 -p 8101:8101 -p 8181:8181 --name solr ddf/solr:2.10.0-SNAPSHOT

FROM oconnormi/ddf:2.9

ENV APP_VERSION=2.9.2
ENV APP_BASE=/opt
ENV APP_HOME=${APP_BASE}/ddf
ENV ENTRYPOINT_HOME=/opt/entrypoint

RUN apk add --no-cache curl unzip

RUN mkdir -p $APP_BASE/tmp \
    && mkdir -p $APP_HOME \
    && cd $APP_BASE/tmp \
    && curl -o ddf.zip "http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.ddf&a=ddf&v=$APP_VERSION&r=releases&e=zip" \
    && unzip ddf.zip \
    && mv ddf-${APP_VERSION}/* $APP_HOME \
    && rm -rf $APP_BASE/tmp

COPY ./etc ${APP_HOME}/etc

RUN chmod 755 ${APP_HOME}/etc/certs/CertNew.sh \
    && ${APP_HOME}/etc/certs/CertNew.sh -cn ${hostname} \
    && sed -i.bak s/REPLACE_HOSTNAME/${hostname}/ ${APP_HOME}/etc/system.properties \
    && sed -i.bak s/REPLACE_SITE_NAME/${siteName}/ ${APP_HOME}/etc/system.properties \
    && sed -i.bak s/REPLACE_HOSTNAME/${siteName}/ ${APP_HOME}/etc/ddf.catalog.federation.impl.CachingFederationStrategy.config \
    && sed -i.bak s/REPLACE_HOSTNAME/${siteName}/ ${APP_HOME}/etc/ddf.catalog.solr.external.SolrHttpCatalogProvider.config \
    && sed -i.bak s/REPLACE_HOSTNAME/${siteName}/ ${APP_HOME}/etc/org.codice.ddf.persistence.internal.PersistentStoreImpl.config

COPY entrypoint/* $ENTRYPOINT_HOME/

VOLUME $APP_HOME/data $APP_HOME/deploy $APP_HOME/etc

EXPOSE 8101 8181 8993

ENTRYPOINT ["/bin/bash", "-c", "$ENTRYPOINT_HOME/entrypoint.sh"]
