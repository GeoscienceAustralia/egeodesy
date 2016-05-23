#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE})

. ./modules.sh

cd ..
watch -n 60 ctags -R ${modules[@]} > /dev/null &
