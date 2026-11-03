#!/bin/sh
# BuildGrid phase 4 egress test (ENG-1525): what a RUN step reaches in our registry with no credentials.
# before phase 4 every line is expected to be 200; after it, 401.
host="staging-nonprod.buildgrid.cx"
other="staging/otter/csv2-pilot.prod.github-com-cloud66-samples-pilot"
tag="ffcd2898bf401288-64e5a3b0622f400"
accept="application/vnd.oci.image.index.v1+json,application/vnd.oci.image.manifest.v1+json,application/vnd.docker.distribution.manifest.v2+json,application/vnd.docker.distribution.manifest.list.v2+json"
code() { curl -s -o /dev/null -w '%{http_code}' --max-time 20 "$@" || echo "curl-failed"; }
echo "EGRESS base_check=$(code "https://$host/v2/")"
echo "EGRESS other_account_manifest=$(code -H "Accept: $accept" "https://$host/v2/$other/manifests/$tag")"
echo "EGRESS other_account_by_address=$(code -k -H "Accept: $accept" "https://134.122.99.191/v2/$other/manifests/$tag")"
echo "EGRESS catalog=$(code "https://$host/v2/_catalog")"
# fail on purpose, so BuildKit prints these lines in the build log
exit 1
