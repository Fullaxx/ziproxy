# Ziproxy is a forwarding (non-caching) compressing HTTP proxy server 

## Base Docker Image
Ubuntu 18.04 (x64)

## Get the image from Docker Hub

    docker pull fullaxx/ziproxy

## Run the image
Run the image on port 8080

    docker run -d -p 8080:8080 fullaxx/ziproxy

Run the image on localhost port 8080

    docker run -d -p 127.0.0.1:8080:8080 fullaxx/ziproxy

## Build it locally using the github repository

    docker build -t="fullaxx/ziproxy" github.com/Fullaxx/ziproxy
