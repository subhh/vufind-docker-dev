#!/bin/bash

echo "Installing VuFind base application"
if [[ ! -d /opt/sites/vufind/logs ]]; then
    mkdir -p /opt/sites/vufind/logs
    chmod 0777 /opt/sites/vufind/logs
fi

echo "Enabling Apache configuration"
if [[ ! -f /etc/apache2/sites-enabled/001-vufind.conf ]]; then
    ln -s /opt/sites/vufind-site/local/docker/config/httpd-vufind.conf /etc/apache2/sites-enabled/001-vufind.conf
fi

cd /opt/sites
if [[ -f vufind-site/composer.local.json ]]; then
    echo "Linking site-specific dependencies"
    ln -sf $(pwd)/vufind-site/composer.local.json $(pwd)/vufind/composer.local.json
fi

echo "Linking site-specific modules"
for module in vufind-site/module/*
do
    echo "...${module}"
    ln -sf $(pwd)/$module $(pwd)/vufind/module/$(basename $module)
done

echo "Linking site-specific themes"
for theme in vufind-site/themes/*
do
    echo "...${theme}"
    ln -sf $(pwd)/$theme $(pwd)/vufind/themes/$(basename $theme)
done

if [[ ! -d /opt/sites/vufind/vendor ]]; then
    echo "Installing dependencies"
    cd /opt/sites/vufind
    composer install --no-dev --no-scripts
    composer update
fi

echo "Starting apache..."
/usr/sbin/apachectl -DFOREGROUND
