#!/bin/bash

/etc/init.d/ziproxy start

exec /app/dockerwait.static.exe
