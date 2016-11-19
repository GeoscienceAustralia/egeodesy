#!/usr/bin/env bash

set -e

#shellcheck source=/dev/null
. ./modules.sh

# fetch and fast-forward the checkouted out branch and submodules
function fast-forward {
    echo "Fast-forward: $(pwd)"

    #shellcheck disable=SC2046
    git fetch $(git rev-parse --symbolic-full-name --abbrev-ref @'{upstream}' | sed 's!/! !')

    git merge --ff-only FETCH_HEAD
}

fast-forward

for m in "${MODULES[@]}"
do
    (cd "../${m}"; fast-forward)
done
