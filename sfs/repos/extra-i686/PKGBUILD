# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>
# You need an sfs user and group to build this package
pkgname=sfs
pkgver=0.7.2
pkgrel=1
pkgdesc="The Secure FileSystem: a secure replacement for nfs"
url="http://www.fs.net"
depends=(gcc gmp nfs-utils)
makedepends=()
conflicts=()
replaces=()
backup=()
install=sfs.install
source=(http://www.fs.net/sfswww/dist/$pkgname-$pkgver.tar.gz sfs.patch sfscd sfssd)

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -N -p1 < ../sfs.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  chmod g-s $startdir/pkg/usr/lib/sfs-0.7.2/suidconnect
  chgrp root $startdir/pkg/usr/lib/sfs-0.7.2/suidconnect

  mkdir -p $startdir/pkg/etc/rc.d
  cp $startdir/src/sfscd $startdir/pkg/etc/rc.d
  cp $startdir/src/sfssd $startdir/pkg/etc/rc.d
}
