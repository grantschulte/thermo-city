#!/bin/bash
yarn build:prod && gh-pages -d ./dist
