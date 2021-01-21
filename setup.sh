#!/usr/bin/env bash

git clone --recurse-submodules -j4 https://github.com/asulibraries/islandora-repo.git
pushd islandora-repo
git apply ../0001-php-downgrade-patch.txt
popd
wget "http://traefik.me/fullchain.pem"
wget "http://traefik.me/privkey.pem"
export DOCKER_BUILDKIT=1 
export COMPOSE_DOCKER_CLI_BUILD=1
docker-compose build
docker-compose up -d
docker-compose exec drupal /var/www/drupal/install.sh