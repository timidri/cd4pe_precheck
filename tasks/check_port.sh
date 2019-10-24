#!/bin/sh

echo Task: $checking $PT_port on $PT_host
curl -s $PT_host:$PT_port >/dev/null && echo Connected. || echo Fail