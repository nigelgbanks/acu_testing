FROM local/drupal:latest

COPY islandora-repo /var/www/drupal

RUN apk --update add \
    php-xmlreader && \
    composer install --no-dev

COPY install.sh /var/www/drupal