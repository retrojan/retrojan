#!/bin/bash

set -e

if [ -d "/tmp/retrojan-clone" ]; then
    rm -rf "/tmp/retrojan-clone"
fi
git clone --depth 1 https://github.com/retrojan/retrojan.git /tmp/retrojan-clone

if [ ! -d "/tmp/retrojan-clone/ignorethis/zapret" ]; then
    echo "Error: /tmp/retrojan-clone/ignorethis/zapret not found"
    exit 1
fi

if [ ! -f "/tmp/retrojan-clone/ignorethis/warp/settings.json" ]; then
    echo "Error: /tmp/retrojan-clone/ignorethis/warp/settings.json not found"
    exit 1
fi

if [ -d "/opt/zapret" ]; then
    sudo rm -rf "/opt/zapret"
fi
sudo cp -r "/tmp/retrojan-clone/ignorethis/zapret" "/opt/zapret"

if [ ! -d "/var/lib/cloudflare-warp" ]; then
    sudo mkdir -p "/var/lib/cloudflare-warp"
fi
sudo cp -f "/tmp/retrojan-clone/ignorethis/warp/settings.json" "/var/lib/cloudflare-warp/settings.json"

rm -rf "/tmp/retrojan-clone"

echo "Done"
