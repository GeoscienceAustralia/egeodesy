#!/usr/bin/env bash

declare -a projects=(
    "GeodesyML"
    "ogc-schemas"
    "geodesyml-java-bindings"
    "igssitelog-java-bindings"
    "geodesy-domain-model"
    "geodesy-domain-rest"
);

cmd="git pull --ff-only && git submodule update --init --recursive --remote"

echo ${cmd}
eval "${cmd}"

for p in ${projects[@]}
do
    echo $p: ${cmd}
    (cd ../${p}; eval ${cmd})
done
