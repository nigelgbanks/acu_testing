#!/usr/bin/with-contenv bash

source /etc/islandora/utilities.sh

create_database default
install_site default

chown -R nginx:nginx /var/www/drupal/web/sites/default
