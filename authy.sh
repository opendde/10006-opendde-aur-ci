#!/bin/sh

export ELECTRON_IS_DEV=0
exec electron /usr/lib/authy/app.asar --no-sandbox "$@"
