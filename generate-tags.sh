#!/usr/bin/env bash

. ./modules.sh

cd ..
watch -n 60 ctags -R ${modules[@]} > /dev/null &
