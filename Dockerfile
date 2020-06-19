# If no build-arg "ALPINE_VERSION" is provided, use the default dnsdist version "3.12"
ARG ALPINE_VERSION=3.12
FROM alpine:${ALPINE_VERSION}

LABEL maintainer="Philip Schmid <docker@ins.hsr.ch>"

# If no build-arg "DNSDIST_VERSION" is provided, use the default dnsdist version "1.4.0-r2"
ARG DNSDIST_VERSION=1.4.0-r2

# Install dnsdist
RUN apk add --no-cache dnsdist=${DNSDIST_VERSION}

# Create working directory
RUN mkdir -p /opt/dnsdist
WORKDIR /opt/dnsdist

# Add minimal example configuration
COPY dnsdist.conf.tmpl /opt/dnsdist/dnsdist.conf

# Add entrypoint script
COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh && \
    chown dnsdist:dnsdist /opt/entrypoint.sh

# Finalize image configuration 
EXPOSE 53 53/udp
ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["--local", "0.0.0.0:53", "-u", "dnsdist", "-g", "dnsdist", "-C", "/opt/dnsdist/dnsdist.conf", "--disable-syslog", "--supervised"]