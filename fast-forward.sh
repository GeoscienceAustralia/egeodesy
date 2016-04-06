#!/usr/bin/env bash

declare -a projects=(
    "GeodesyML"
    "ogc-schemas"
    "geodesyml-java-bindings"
    "igssitelog-java-bindings"
    "geodesy-domain-model"
    "geodesy-domain-rest"
    "xml-schemer"
);

# fetch and fast-forward the checkouted out branch and submodules
function fast-forward {
    echo "Fast-forward: `pwd`"
    git fetch $(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} | sed 's!/! !')
    git merge --ff-only FETCH_HEAD
    # TODO: Submodule update brings down all branches, we want just the tracked branch.
    # Perhaps a separate script to do the initial cloning is the way to go.
    git submodule update --init --recursive --remote
}

fast-forward

for p in ${projects[@]}
do
    (cd ../${p}; fast-forward)
done
