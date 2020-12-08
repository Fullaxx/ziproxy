# A small docker image running Ziproxy

## Base Docker Image
[Ubuntu](https://hub.docker.com/_/ubuntu) 20.04 (x64)

## Software
[Ziproxy](http://ziproxy.sourceforge.net/) - A forwarding (non-caching) compressing HTTP proxy server


## Get the image from Docker Hub
```
docker pull fullaxx/ziproxy
```

## Run the image
Run the image on port 8080
```
docker run -d -p 8080:8080 fullaxx/ziproxy
```
Run the image on localhost port 8080
```
docker run -d -p 127.0.0.1:8080:8080 fullaxx/ziproxy
```
Run the image on localhost port 8080 saving logs to /srv/docker/ziproxy/logs
```
docker run -d -p 127.0.0.1:8080:8080 -v /srv/docker/ziproxy/logs:/var/log/ziproxy fullaxx/ziproxy
```

## Build it locally using the github repository
```
docker build -t="fullaxx/ziproxy" github.com/Fullaxx/ziproxy
```
