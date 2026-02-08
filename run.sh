#! /bin/sh

# these vars are not available at buildtime so we need to import them at runtime
export SAMLETCHAT_PORT=$PORT
export SAMLETCHAT_POSTGRES=$DATABASE_URL

./samlet-chat
