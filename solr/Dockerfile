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

FROM anapsix/alpine-java:jdk

ARG repo=releases
ARG version
ARG hostname=solr
ARG siteName=solr

EXPOSE 8101
EXPOSE 8181
EXPOSE 8993

ENV DDF_VERSION=${version}
ENV DDF_BASE="/opt/ddf"
ENV DDF_HOME=${DDF_BASE}/ddf-${DDF_VERSION}

RUN apk add --no-cache curl unzip

RUN mkdir -p $DDF_BASE/tmp \
    && mkdir -p $DDF_HOME \
    && cd $DDF_BASE/tmp \
    && curl -o ddf.zip "http://artifacts.codice.org/service/local/artifact/maven/content?g=org.codice.ddf&a=ddf&v=$DDF_VERSION&r=snapshots&e=zip" \
    && unzip ddf.zip \
    && mv ddf-${DDF_VERSION}/* $DDF_HOME \
    && rm -rf $DDF_BASE/tmp

COPY ./etc ${DDF_HOME}/etc

RUN chmod 755 ${DDF_HOME}/etc/certs/CertNew.sh \
    && ${DDF_HOME}/etc/certs/CertNew.sh -cn ${hostname}

RUN sed -i.bak s/REPLACE_HOSTNAME/${hostname}/ ${DDF_HOME}/etc/system.properties \
    && sed -i.bak s/REPLACE_SITE_NAME/${siteName}/ ${DDF_HOME}/etc/system.properties \
    && sed -i.bak s/REPLACE_HOSTNAME/${siteName}/ ${DDF_HOME}/etc/ddf.catalog.federation.impl.CachingFederationStrategy.config \
    && sed -i.bak s/REPLACE_HOSTNAME/${siteName}/ ${DDF_HOME}/etc/ddf.catalog.solr.external.SolrHttpCatalogProvider.config \
    && sed -i.bak s/REPLACE_HOSTNAME/${siteName}/ ${DDF_HOME}/etc/org.codice.ddf.persistence.internal.PersistentStoreImpl.config

ENTRYPOINT ["/bin/bash", "-c", "${DDF_HOME}/bin/ddf; tail -f /dev/null"]
