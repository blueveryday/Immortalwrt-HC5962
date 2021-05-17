#!/bin/bash

git clone "https://github.com/immortalwrt/immortalwrt.git" --branch "openwrt-18.06" --single-branch "immortalwrt"

pushd "immortalwrt"; 

sed -i 's/192.168.1.1/192.168.62.1/g' package/base-files/files/bin/config_generate                                            #修改路由器管理IP地址
sed -i 's/ImmortalWrt/HC5962/g' package/base-files/files/bin/config_generate                                                  #修改路由器主机名
sed -i 's/OpenWrt/HC5962/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh                                                #修改WiFi名称

sed -i 's/set wireless.default_radio${devidx}.ssid=OpenWrt/set wireless.default_radio${devidx}.ssid=HC5962/g'                 #修改WiFi名称
sed -i 's/set wireless.default_radio${devidx}.encryption=none/set wireless.default_radio${devidx}.encryption=psk2/g'          #增加WiFi的PSK2加密方式
sed -e '/set wireless.default_radio${devidx}.encryption=psk2/a\			set wireless.default_radio${devidx}.key=password'         #增加WiFi密码为password

./scripts/feeds update -a -f
./scripts/feeds install -a -f

popd
