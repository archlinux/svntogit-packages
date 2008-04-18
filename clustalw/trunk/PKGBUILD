# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=clustalw
pkgver=1.83
pkgrel=1
pkgdesc="clustal w multiple sequence alignment program"
url="ftp://ftp-igbmc.u-strasbg.fr/pub/ClustalW/"
depends=('glibc')
source=($url/${pkgname}${pkgver}.UNIX.tar.gz)

build() {
  cd $startdir/src/$pkgname$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp clustalw $startdir/pkg/usr/bin
}

