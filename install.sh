#!/usr/bin/with-contenv bash

source /etc/islandora/utilities.sh

create_database DEFAULT
install_site DEFAULT

chown -R nginx:nginx /var/www/drupal/web/sites/default
