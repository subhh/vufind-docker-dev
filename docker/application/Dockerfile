FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# 0. Prepare base system

RUN apt-get -y install software-properties-common unzip
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get -y install git sudo
RUN apt-get -y install libapache2-mod-php7.4 php7.4-zip php7.4-mbstring php7.4 php7.4-dev php7.4-gd php7.4-intl php7.4-json php7.4-ldap php7.4-mysql php7.4-xml php7.4-soap php7.4-curl

RUN a2enmod rewrite
RUN a2enmod proxy_http
RUN a2dissite 000-default

# 1. Install VuFind

ENV VUFIND_HOME /opt/sites/vufind
ENV VUFIND_LOCAL_DIR /opt/sites/vufind-site/local/docker
ENV VUFIND_CACHE_DIR /tmp/vufind
ENV VUFIND_ENV development

RUN mkdir ${VUFIND_CACHE_DIR}
RUN chown -R www-data:www-data ${VUFIND_CACHE_DIR}

EXPOSE 80

COPY docker/application/composer /usr/local/bin
COPY docker/application/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
