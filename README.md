# Little Experiment

To setup run `./setup.sh`

When this is complete drupal should be installed and the site can be accessible
at `acu.traefik.me`.

After that point you can import the configuration with the following command:

```bash
docker-compose exec drupal /var/www/drupal/config.sh
```

You may need to run it multiple times as it's not very reliable.

This is only to bring up a site we can browser and in look at configuration, etc so no derivatives or solr search etc.
