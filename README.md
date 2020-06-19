# PowerDNS dnsdist
Dockerized version of dnsdist (https://dnsdist.org/). Pre-build image can be found here: https://hub.docker.com/r/hsrnetwork/dnsdist

## Prerequisites
```bash
cp dnsdist.conf.tmpl dnsdist.conf
# Edit the configuration according to your needs
```

Build the image:
```bash
docker build -t hsrnetwork/dnsdist:lastest .
# or
ALPINE_VER="3.12"
DNSDIST_VER="1.4.0-r2"
docker build \
  --build-arg DNSDIST_VERSION=$DNSDIST_VER \
  --build-arg ALPINE_VERSION=$ALPINE_VER \
  -t hsrnetwork/dnsdist:$DNSDIST_VER .
```

## Getting Started
```bash
docker run -d -p 53:53 -p 53:53/udp hsrnetwork/dnsdist:lastest
```
or
```bash
docker-compose up -d
```

## Version update
In order to update the version inside the automated Docker Hub build, set the values inside the `VERSION` file. Ensure that the specified `DNSDIST_VERSION` version is available on your chosen `ALPINE_VERSION`! Check https://pkgs.alpinelinux.org/packages for this information.