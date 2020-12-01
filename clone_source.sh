#!/bin/bash

git clone "https://blueveryday@163.com:yjj31hb30@github.com/blueveryday/CTCGFW-Openwrt.git" --branch "openwrt-18.06" --single-branch "openwrt"
pushd "openwrt"; ./scripts/feeds update -a; ./scripts/feeds install -a; popd
