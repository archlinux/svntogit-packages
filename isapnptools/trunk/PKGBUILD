# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=isapnptools
pkgver=1.26
pkgrel=1
pkgdesc="allow ISA Plug-And-Play devices to be configured on a Linux machine"
url="http://www.roestock.demon.co.uk/isapnptools/"
depends=('glibc')
source=(ftp://metalab.unc.edu/pub/Linux/system/hardware/isapnptools-$pkgver.tgz)
md5sums=()

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
