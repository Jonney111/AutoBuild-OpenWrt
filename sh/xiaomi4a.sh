#!/bin/bash
#
# Copyright (c) P3TERX 
# Copyright (c) esirplayground
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.

# File name: r2s.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.5.1）
# sed -i 's/192.168.5.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#1. Modify default IP
sed -i 's/192.168.1.1/192.168.5.1/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

# a dependency on 'luci-lib-ipkg', which does not exist
# sed -i 's/luci-lib-ipkg/luci-base/g' package/feeds/kenzo/luci-app-bypass/Makefile


# Modify system hostname（FROM OpenWrt CHANGE TO JonneyLee）
# sed -i 's/OpenWrt/JonneyLee/g' package/base-files/files/bin/config_generate

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings
# sed -i 's/invalid users = root/#invalid users = root/g' feeds/packages/net/samba4/files/smb.conf.template



# 拉取软件包

#adguardhome
svn co https://github.com/Jonney111/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
openclash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#diskman
svn co https://github.com/lisaac/luci-app-diskman/trunk/applications/luci-app-diskman package/luci-app-diskman
#passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/openwrt-passwall
svn co https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall package/luci-app-passwall
#Ssr plus
git clone https://github.com/fw876/helloworld.git package/helloworld
#smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/smartdns package/smartdns
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-smartdns package/luci-app-smartdns
#HelloWorld
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lean/lua-maxminddb  #git lua-maxminddb 依赖
git clone https://github.com/jerrykuku/luci-app-vssr.git package/lean/luci-app-vssr
#argon主题
#git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/kenzok78/luci-theme-argonne.git package/luci-theme-argonne



# 删除重复包

#rm -rf feeds/luci/themes/luci-theme-argon
