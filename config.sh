#!/usr/bin/env bash

source /etc/islandora/utilities.sh

set_site_uuid DEFAULT "07393f3a-1e7c-46f0-824e-bdef6c299b02"
# No idea why this is required but cannot import otherwise.
# Probably a dependency issue.
drush pm-enable -y persistent_identifiers
drush pm-enable -y features
drush pm-enable -y entity_embed
drush pm-enable -y entity_browser
drush pm-enable -y islandora_defaults
drush config:import -y --partial