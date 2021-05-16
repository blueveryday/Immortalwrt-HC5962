#!/bin/bash

git clone "https://github.com/immortalwrt/immortalwrt.git" --branch "openwrt-18.06" --single-branch "immortalwrt"

pushd "immortalwrt"; 

sed -i 's/192.168.1.1/192.168.62.1/g' package/base-files/files/bin/config_generate        #修改路由器管理IP地址
sed -i 's/ImmortalWrt/HC5962/g' package/base-files/files/bin/config_generate              #修改路由器主机名
sed -i 's/OpenWrt/HC5962/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh            #修改WiFi名称

./scripts/feeds update -a -f
./scripts/feeds install -a -f

popd
