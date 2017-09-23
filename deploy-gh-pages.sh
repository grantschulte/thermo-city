#!/bin/bash
# CNAME="your-domain.com"
# echo $CNAME > ./dist/CNAME
yarn build:prod && gh-pages -d ./dist
