# ------------------------------------------------------------------------------
# Pull base image
FROM ubuntu:bionic
MAINTAINER Brett Kuskie <fullaxx@gmail.com>

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND noninteractive

# ------------------------------------------------------------------------------
# Install ziproxy and clean up
RUN apt-get update && apt-get install -y --no-install-recommends ziproxy && \
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* && \
sed -e 's@# DebugLog = "/var/log/ziproxy/debug.log"@DebugLog = "/var/log/ziproxy/debug.log"@' \
-e 's@# ErrorLog = "/var/log/ziproxy/error.log"@ErrorLog = "/var/log/ziproxy/error.log"@' \
-e 's@# AccessLog = "/var/log/ziproxy/access.log"@AccessLog = "/var/log/ziproxy/access.log"@' \
-i /etc/ziproxy/ziproxy.conf && mkdir /var/log/ziproxy

# ------------------------------------------------------------------------------
# Install scripts and configuration files
COPY dockerwait.static /app/

# ------------------------------------------------------------------------------
# Add volumes
VOLUME /var/log/ziproxy

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 8080

# ------------------------------------------------------------------------------
# Define default command
CMD ["/etc/init.d/ziproxy" "start"]
CMD ["/app/dockerwait.static"]
