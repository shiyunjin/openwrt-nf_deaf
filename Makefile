include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=nf-deaf
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define KernelPackage/nf-deaf
	SUBMENU:=Netfilter Extensions
	TITLE:=nf deaf expression support
	FILES:= $(PKG_BUILD_DIR)/nf_deaf.ko
	KCONFIG:= CONFIG_NF_DEAF=y
	PROVIDES:=$(PKG_NAME)
	AUTOLOAD:=$(call AutoProbe,nf-deaf)
endef

define KernelPackage/nf-deaf/Description
	NF-DEAF
endef

# make use of all CPUs
define Build/Compile
	+$(MAKE) $(PKG_JOBS) $(KERNEL_MAKEOPTS) \
		M="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS="$(BUILDFLAGS)" \
		modules

endef

$(eval $(call KernelPackage,nf-deaf))
