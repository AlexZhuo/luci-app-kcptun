include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-kcptun
PKG_VERSION:=1.2.1
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	CATEGORY:=Network
	SUBMENU:=Luci
	TITLE:=LuCI support for Kcptun
	PKGARCH:=all
endef


define Package/$(PKG_NAME)/description
    A luci app for kcptun
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
rm -rf /tmp/luci*
endef

define Build/Prepare
	$(foreach po,$(wildcard ${CURDIR}/i18n/zh-cn/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/kcptun.*.lmo $(1)/usr/lib/lua/luci/i18n/
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
