# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=lilo
pkgver=22.8
pkgrel=2
pkgdesc="A bootloader for Linux"
arch=(i686 x86_64)
url="http://lilo.go.dyndns.org"
license=('BSD')
# While lilo should stay in the base category,
# it usually makes no sense if it is installed
# with pacman -S base, therefore, don't add
# the base group here.
#groups=('base')
backup=(etc/lilo.conf)
depends=(device-mapper coreutils)
makedepends=(bin86)
install=lilo.install
source=(http://home.san.rr.com/johninsd/pub/linux/lilo/lilo-$pkgver.src.tar.gz lilo.conf)
md5sums=('72765f2aafd20e23ecf07ebd22baeec7' 'a3a4c90bead3f9b8672bd384ff9f8db1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make ROOT=$startdir/pkg MAN_DIR=/usr/man install
  mkdir -p $startdir/pkg/etc
  cp $startdir/$pkgname.conf $startdir/pkg/etc/
  # install license
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
