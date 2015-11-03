#!/bin/sh

# ----------------------------------------------------------------------------------------------------------------------
# Run Salt states
# ----------------------------------------------------------------------------------------------------------------------

sudo sh scripts/provision.sh

# ----------------------------------------------------------------------------------------------------------------------
# Change working directory
# ----------------------------------------------------------------------------------------------------------------------

cd /var/www

# ----------------------------------------------------------------------------------------------------------------------
# Pull from SVC
# ----------------------------------------------------------------------------------------------------------------------

git checkout .
git pull

# ----------------------------------------------------------------------------------------------------------------------
# Post-deploy tasks
# ----------------------------------------------------------------------------------------------------------------------

sudo service cron restart