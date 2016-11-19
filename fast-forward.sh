#!/usr/bin/env bash

set -e

#shellcheck source=/dev/null
. ./modules.sh

# fetch and fast-forward the checkouted out branch and submodules
function fast-forward {
    echo "Fast-forward: $(pwd)"
    git fetch "$(git rev-parse --symbolic-full-name --abbrev-ref @'{upstream}' | sed 's!/! !')"
    git merge --ff-only FETCH_HEAD
    # TODO: Submodule update brings down all branches, we want just the tracked branch.
    # Perhaps a separate script to do the initial cloning is the way to go.
    git submodule update --init --recursive --remote
}

fast-forward

for m in "${MODULES[@]}"
do
    (cd "../${m}"; fast-forward)
done
