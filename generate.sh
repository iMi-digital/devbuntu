#!/bin/bash

replace() {
sedStr="
  s!%%PHP_VERSION%%!$version!g;
"

sed -r "$sedStr" $1
}

versions=(5.6 7.0 7.1 7.2)
for version in ${versions[*]}; do
  cp -f 20-xdebug.ini $version/full/
  replace Dockerfile.template > $version/full/Dockerfile
done
