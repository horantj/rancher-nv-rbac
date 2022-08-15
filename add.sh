#!/bin/bash

# create API key set here or export
# https://rancher.com/docs/rancher/v2.6/en/user-settings/api-keys/
CATTLE_ACCESS_KEY=token-7l5xt
CATTLE_SECRET_KEY=hc2ztk97glsrclhc96vvd4q644w9wdvb6wpd6mk2v6vxxldf98bqk2

# address for rancher server, including https, no trailing /
RANCHER_SERVER=https://rancher.3.236.100.199.sslip.io

# list of json files to import, separated by space
jsons=$(find files -type f -name "*.json")

function post_roletemplate {
curl -k  -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" \
-X POST \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
"${RANCHER_SERVER}/v3/roletemplates" \
-d @${1}
}

for file in ${jsons}; do post_roletemplate ${file}; done
