#!/bin/bash

git clone "https://github.com/blueveryday/openwrt.git" --branch "openwrt-18.06" --single-branch "openwrt"
pushd "openwrt"; ./scripts/feeds update -a; ./scripts/feeds install -a; popd
