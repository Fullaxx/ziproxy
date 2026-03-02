#!/bin/bash

grep '^FROM ' Dockerfile | awk '{print $2}' | xargs -n1 docker pull

docker build -t "ghcr.io/fullaxx/ziproxy" .
