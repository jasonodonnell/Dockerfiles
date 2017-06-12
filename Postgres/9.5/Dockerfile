# This image is based on CentOS 7 and will start postgres
FROM centos:latest
MAINTAINER drlovewizard@gmail.com

ENV PGVERSION="9.5" \
    PGVERSIONSHORT="95"\
    PGDG_REPO="pgdg-centos95-9.5-3.noarch.rpm"

RUN yum update -y

RUN yum install -y \
    https://download.postgresql.org/pub/repos/yum/${PGVERSION}/redhat/rhel-7-x86_64/${PGDG_REPO}

RUN yum install -y \
    postgresql${PGVERSIONSHORT} \
    postgresql${PGVERSIONSHORT}-contrib \
    postgresql${PGVERSIONSHORT}-libs \
    postgresql${PGVERSIONSHORT}-server \
    postgresql${PGVERSIONSHORT}-docs

USER postgres
RUN /usr/pgsql-${PGVERSION}/bin/initdb \
    --username=postgres \
    --data-checksums \
    --pgdata=/var/lib/pgsql/${PGVERSION}/data

USER root
ADD conf/ /var/lib/pgsql/${PGVERSION}/data
ADD bin/ /var/lib/pgsql
RUN chown postgres:postgres /var/lib/pgsql/setup.sh \
    && chmod +x /var/lib/pgsql/setup.sh

EXPOSE 5432

USER postgres
ENTRYPOINT /var/lib/pgsql/setup.sh && /bin/bash
