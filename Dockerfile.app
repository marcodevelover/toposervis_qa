FROM ruby:2.6.4

USER root

WORKDIR /opt/app

COPY ./docker-entrypoint.sh /opt/app/docker-entrypoint.sh

RUN set -ex \
  && apt-get update -y && apt-get upgrade -y \
  && apt-get  install -y --force-yes \
     apt-utils \
     ca-certificates \
     build-essential \
     dos2unix \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get update -y \
  && apt-get install -y --force-yes \
     nodejs \
  && npm install --global yarn \
  && dos2unix /opt/app/docker-entrypoint.sh \
  && chmod +x /opt/app/docker-entrypoint.sh \
  && echo '--END RUN--'