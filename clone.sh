#!/usr/bin/env bash

. ./modules.sh

case $1 in
    "ssh" )
        repo_url_prefix=git@github.com:GeoscienceAustralia ;;
    * )
        repo_url_prefix=https://github.com/GeoscienceAustralia ;;
esac

for m in ${modules[@]}
do
    git clone ${repo_url_prefix}/${m}
done
