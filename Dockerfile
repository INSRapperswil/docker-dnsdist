FROM alpine:3.10.2

LABEL maintainer="Philip Schmid <docker@ins.hsr.ch>"

# Install dnsdist
RUN apk add --no-cache dnsdist

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