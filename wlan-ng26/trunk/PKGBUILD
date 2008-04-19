# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>

pkgname=wlan-ng26
pkgver=0.2.8
pkgrel=16
_kernver=2.6.25-ARCH
pkgdesc="Wireless Lan usb modules. For kernel26."
arch=(i686 x86_64)
license=('MPL')
depends=('kernel26>=2.6.25' 'kernel26<2.6.26' 'wlan-ng26-utils')
source=(ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/linux-wlan-ng-$pkgver.tar.bz2
	kernel-2.6.22-r1832.patch kernel-2.6.24.patch)
url="ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/"
install=wlan-ng26.install
options=(!makeflags)
md5sums=('5d86ca7bb4ed458743acd922ff09dae6'
         '1696441de62db35d9385f15ee2dfb5a7'
         'c2cf1f3951e00d616176c19102d245e8')

build() {
   cd $startdir/src/linux-wlan-ng-$pkgver
   patch -Np1 -i ../kernel-2.6.22-r1832.patch || return 1
   patch -Np0 -i ../kernel-2.6.24.patch || return 1
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

