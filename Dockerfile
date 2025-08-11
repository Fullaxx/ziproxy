# ------------------------------------------------------------------------------
# Build dockerwait (https://github.com/Fullaxx/dockerwait)
FROM alpine AS build
RUN apk add -U build-base git curl
RUN git clone https://github.com/Fullaxx/dockerwait && \
	cd dockerwait && ./compile.sh

# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:jammy
LABEL author="Brett Kuskie <fullaxx@gmail.com>"

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# ------------------------------------------------------------------------------
# Install ziproxy and clean up
RUN apt-get update && apt-get install -y --no-install-recommends ziproxy && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Configure ziproxy
RUN sed -e 's@# Port = 8080@Port = 8080@' \
-e 's@Address = "127.0.0.1"@# Address = "127.0.0.1"@' \
-e 's@# DebugLog = "/var/log/ziproxy/debug.log"@DebugLog = "/var/log/ziproxy/debug.log"@' \
-e 's@# ErrorLog = "/var/log/ziproxy/error.log"@ErrorLog = "/var/log/ziproxy/error.log"@' \
-e 's@# AccessLog = "/var/log/ziproxy/access.log"@AccessLog = "/var/log/ziproxy/access.log"@' \
-i /etc/ziproxy/ziproxy.conf && mkdir /var/log/ziproxy

# ------------------------------------------------------------------------------
# Install startup script with dockerwait
COPY app.sh /app/
COPY --from=build /dockerwait/dockerwait.static /app/dockerwait.static.exe

# ------------------------------------------------------------------------------
# Add volumes
VOLUME /var/log/ziproxy

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 8080

# ------------------------------------------------------------------------------
# Define runtime command
CMD ["/app/app.sh"]
