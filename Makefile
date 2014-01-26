#
# Copyright (C) 2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#


include $(TOPDIR)/rules.mk

PKG_NAME:=logtemp
PKG_VERSION:=1.0

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/logtemp
  SECTION:=logtemp
  CATEGORY:=Utilities
  TITLE:=logtemp
endef

define Package/logtemp/description
	Some misc shellscripts to log temperature to CSV file on an external drive
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/logtemp/install
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/hwclock $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/tmp102 $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/logtemp $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/rc.d
	ln -s $(1)/etc/init.d/cron $(1)/etc/rc.d/S50cron
	ln -s $(1)/etc/init.d/tmp102 $(1)/etc/rc.d/S50tmp102
	$(INSTALL_DIR) $(1)/etc/crontabs
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/crontabs/root $(1)/etc/crontabs
endef

$(eval $(call BuildPackage,logtemp))