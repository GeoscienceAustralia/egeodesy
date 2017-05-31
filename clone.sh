#!/usr/bin/env bash

#shellcheck source=/dev/null
. ./modules.sh

case $1 in
    "ssh" )
        repo_url_prefix=git@github.com:GeoscienceAustralia ;;
    * )
        repo_url_prefix=https://github.com/GeoscienceAustralia ;;
esac

(cd .. && \
for m in "${MODULES[@]}"
do
    git clone -b master "${repo_url_prefix}/${m}"
done)
