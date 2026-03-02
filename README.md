# A docker image running Ziproxy

## Base Docker Image
[Ubuntu](https://hub.docker.com/_/ubuntu) 24.04 (x64)

## Software
[Ziproxy](http://ziproxy.sourceforge.net/) - A forwarding (non-caching) compressing HTTP proxy server

## Pull the image or Build it locally
```
docker pull ghcr.io/fullaxx/ziproxy

docker build -t="ghcr.io/fullaxx/ziproxy" github.com/Fullaxx/ziproxy
```

## Run the image
Run the image on port 8080
```
docker run -d -p 8080:8080 ghcr.io/fullaxx/ziproxy
```
Run the image on localhost port 8080
```
docker run -d -p 127.0.0.1:8080:8080 ghcr.io/fullaxx/ziproxy
```
Run the image on localhost port 8080 saving logs to /srv/docker/ziproxy/logs
```
docker run -d -p 127.0.0.1:8080:8080 -v /srv/docker/ziproxy/logs:/var/log/ziproxy ghcr.io/fullaxx/ziproxy
```
