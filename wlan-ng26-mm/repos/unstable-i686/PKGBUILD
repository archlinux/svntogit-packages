# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>

pkgname=wlan-ng26-mm
pkgver=0.2.8
pkgrel=3
_kernver=2.6.23-mm
pkgdesc="Wireless Lan usb modules. For kernel26mm."
arch=(i686 x86_64)
license=('MPL')
depends=('kernel26mm' 'wlan-ng26-utils')
source=(ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/linux-wlan-ng-$pkgver.tar.bz2
	kernel-2.6.22-r1832.patch)
url="ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/"
install=wlan-ng26.install

build() {
   cd $startdir/src/linux-wlan-ng-$pkgver
   patch -Np1 -i ../kernel-2.6.22-r1832.patch || return 1
   # only built usb modules the rest is covered by hostap and orinoco driver, according to gentoo changelog 
   sed -i "s#PRISM2_PCMCIA=y#PRISM2_PCMCIA=n#;s#TARGET_ROOT_ON_HOST=#TARGET_ROOT_ON_HOST=$startdir/pkg#;s#PRISM2_PLX=y#PRISM2_PLX=n#;s#PRISM2_PCI=y#PRISM2_PCI=n#;s#PRISM2_USB=n#PRISM2_USB=y#;s%#LINUX_SRC=/usr/src/linux%LINUX_SRC=/lib/modules/${_kernver}/build%" config.in
   make auto_config
   make all || return 1
   make install
   sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" $startdir/wlan-ng26.install
   rm -r $startdir/pkg/{etc,sbin,usr,init.d}
   # fix module path
   mkdir -p $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless
   mv $startdir/pkg/lib/modules/${_kernver}/linux-wlan-ng \
      $startdir/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless
}
