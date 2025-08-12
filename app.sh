#!/bin/bash

/etc/init.d/ziproxy start

export DOCKERWAIT_EXIT_COMMAND="/etc/init.d/ziproxy stop"

exec /app/dockerwait.static.exe
