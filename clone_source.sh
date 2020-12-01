#!/bin/bash

git clone "https://d3ac58c289e186fa21181cd50eee00b2483758b7@github.com/blueveryday/CTCGFW-Openwrt.git" --branch "openwrt-18.06" --single-branch "openwrt"
pushd "openwrt"; ./scripts/feeds update -a; ./scripts/feeds install -a; popd
