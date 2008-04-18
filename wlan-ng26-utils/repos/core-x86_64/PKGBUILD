# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>

pkgname=wlan-ng26-utils
pkgver=0.2.8
pkgrel=2
pkgdesc="Wireless Lan userspace tools."
depends=('glibc' 'bash')
makedepends=('kernel26')
source=(ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/linux-wlan-ng-$pkgver.tar.bz2 \
	wlan-ng.patch wlan kernel-2.6.22-r1832.patch)
url="ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/"
backup=(etc/wlan/wlan.conf)
arch=('i686' 'x86_64')
license=('MPL')

build() {
   cd $startdir/src/linux-wlan-ng-$pkgver
   patch -Np1 -i ../kernel-2.6.22-r1832.patch || return 1
   sed -i "s#TARGET_ROOT_ON_HOST=#TARGET_ROOT_ON_HOST=$startdir/pkg#;s#PRISM2_PLX=y#PRISM2_PLX=n#;s#PRISM2_PCI=y#PRISM2_PCI=n#" config.in
   patch -p1 < ../wlan-ng.patch
   make auto_config
   make all || return 1
   make install
   mkdir -p $startdir/pkg/etc/rc.d
   rm -r $startdir/pkg/{init.d,lib,etc/pcmcia}
   install -m 755 $startdir/src/wlan $startdir/pkg/etc/rc.d/wlan
}
md5sums=('5d86ca7bb4ed458743acd922ff09dae6'
         'bb9fa3ff6ad5b2dfc67e8a6ac176446b'
         '1056365bdbe7102b1a668c84926ecb17'
         '1696441de62db35d9385f15ee2dfb5a7')
