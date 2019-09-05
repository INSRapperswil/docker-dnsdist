#!/bin/sh

# Check if the configuration file exists
FILE=/opt/dnsdist/dnsdist.conf
if [[ ! -f "$FILE" ]]; then
    echo "===> FAILED: $FILE does not exist. Ensure your Docker volume is mounted properly."
fi

# Check if the config is valid
dnsdist -C /opt/dnsdist/dnsdist.conf --check-config 
if [[ $? -ne 0 ]]; then
  echo "===> FAILED: dnsdist config is not valid."
  exit 1
fi

exec dnsdist "$@"
