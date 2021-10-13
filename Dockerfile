# syntax=docker/dockerfile:experimental
FROM local/drupal:latest

COPY islandora-repo/composer.json /var/www/drupal
COPY islandora-repo/composer.lock /var/www/drupal
COPY islandora-repo/scripts /var/www/drupal/scripts

RUN --mount=type=cache,target=/var/cache/apk \
    --mount=type=cache,target=/root/.composer/cache \
    apk --update add \
    php-xmlreader && \
    composer install --no-dev && \
    chown -R nginx:nginx /var/www

RUN git clone https://github.com/mjordan/persistent_identifiers.git /var/www/drupal/web/modules/contrib/persistent_identifiers && \
    git clone https://github.com/mjordan/islandora_riprap.git /var/www/drupal/web/modules/contrib/islandora_riprap && \
    git clone https://github.com/mjordan/islandora_bagger_integration.git /var/www/drupal/web/modules/contrib/islandora_bagger_integration && \
    chown -R nginx:nginx /var/www/drupal/web/modules/contrib

COPY --chown=nginx:nginx islandora-repo /var/www/drupal
COPY --chown=nginx:nginx install.sh /var/www/drupal
COPY --chown=nginx:nginx config.sh /var/www/drupal