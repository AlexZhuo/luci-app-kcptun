# luci-app-kcptun
Luci support for kcptun

修改https://github.com/kuoruan/luci-app-kcptun 以适配ImageBulder CC 15.05.1的OpenWrt luci配置页面

## 编译

从 OpenWrt 的 [SDK][openwrt-sdk] 编译

```
# 解压下载好的 SDK
tar xjf OpenWrt-SDK-ar71xx-for-linux-x86_64-gcc-4.8-linaro_uClibc-0.9.33.2.tar.bz2
cd OpenWrt-SDK-ar71xx-*
# Clone 项目
git clone https://github.com/AlexZhuo/luci-app-kcptun.git package/luci-app-kcptun
# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-kcptun/tools/po2lmo
make && sudo make install
popd
# 选择要编译的包 Network -> LuCI -> luci-app-kcptun
make menuconfig
# 开始编译
make package/luci-app-kcptun/compile V=99
```

## 安装说明

1. 根据 OpenWrt 固件版本编译luci-app-kcptun
2. 将编译好的 ipk 文件上传到 OpenWrt 目录下, 如 /tmp 目录
3. 使用 shell 登陆路由器, 切换到上传目录下, 先安装 luci-app-kcptun
```
opkg install luci-app-kcptun_*.ipk
```

安装好 luci 之后需要下载路由器对应版本的 Kcptun 客户端文件, 下载之后上传到路由器上的/usr/bin/kcptun/client和/usr/bin/kcptun/server

之后到 luci 中配置好客户端或路径即可使用, 若提示不是 Kcptun 文件, 说明所下载的客户端文件不适合当前路由器, 请重新下载

## Kcptun 客户端

下载地址: https://github.com/xtaci/kcptun/releases

ar71xx ramips 可以到这里下载 https://github.com/bettermanbao/openwrt-kcptun/releases

## 卸载说明

卸载时需要先卸载luci-app-kcptun, 再卸载/usr/bin/kcptun/*

```
opkg remove luci-app-kcptun
rm -rf /usr/bin/kcptun
```
截图
---
![](https://github.com/AlexZhuo/BreakwallOpenWrt/raw/master/screenshots/kcptun1.png)

![](https://github.com/AlexZhuo/BreakwallOpenWrt/raw/master/screenshots/kcptun2.png)

![](https://github.com/AlexZhuo/BreakwallOpenWrt/raw/master/screenshots/kcptun3.png)

[A]: http://www.right.com.cn/forum/thread-198649-1-1.html
[openwrt-sdk]: https://wiki.openwrt.org/doc/howto/obtain.firmware.sdk
