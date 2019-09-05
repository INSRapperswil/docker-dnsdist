# PowerDNS dnsdist
Dockerized version of dnsdist (https://dnsdist.org/).

## Prerequisites
```bash
cp dnsdist.conf.tmpl dnsdist.conf
# Edit the configuration according to your needs
```

Build the Image:
```bash
docker build -t hsrnetwork/dnsdist:lastest .
```

## Getting Started
```bash
docker run -d -p 53:53 -p 53:53/udp hsrnetwork/dnsdist:lastest
```
or
```bash
docker-compose up -d
```
