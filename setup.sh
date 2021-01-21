#!/usr/bin/env bash

git clone --recurse-submodules -j4 https://github.com/asulibraries/islandora-repo.git
pushd islandora-repo
git apply ../0001-php-downgrade-patch.txt
popd
docker-compose up -d
docker-compose exec drupal /var/www/drupal/install.sh