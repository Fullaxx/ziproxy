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
apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Install scripts and configuration files
COPY app.sh dockerwait.static /app/

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 8080

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
