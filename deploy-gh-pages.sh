#!/bin/bash
CNAME="thermo.city"
echo $CNAME > ./dist/CNAME
yarn build:prod && gh-pages -d ./dist
