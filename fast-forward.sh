#!/usr/bin/env bash

declare -a projects=(
    "GeodesyML"
    "ogc-schemas"
    "geodesyml-java-bindings"
    "igssitelog-java-bindings"
    "geodesy-domain-model"
    "geodesy-domain-rest"
);

# TODO: also update submodules
cmd="git pull --ff-only"

echo ${cmd}
${cmd}

for p in ${projects[@]}
do
    echo $p: ${cmd}
    (cd ../${p}; ${cmd})
done
