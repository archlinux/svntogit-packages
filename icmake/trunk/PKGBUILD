# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
pkgname=icmake
pkgver=6.22
pkgrel=1
pkgdesc="Intelligent C-like MAKE-r."
url="ftp://ftp.rug.nl/contrib/frank/software/linux/icmake/"
depends=('glibc')
makedepends=()
source=(ftp://ftp.rug.nl/contrib/frank/software/linux/$pkgname/$pkgname-$pkgver.tgz \
		ftp://ftp.rug.nl/contrib/frank/software/linux/$pkgname/$pkgname.1 )

build() {
  cd $startdir/src/$pkgname
  /bin/sh bootstrap
  install -m755 -D bin/icm-comp  $startdir/pkg/usr/bin/icm-comp
  install -m755 -D bin/icm-exec  $startdir/pkg/usr/bin/icm-exec
  install -m755 -D bin/icm-pp  $startdir/pkg/usr/bin/icm-pp
  install -m755 -D bin/icmake  $startdir/pkg/usr/bin/icmake
  install -m755 -D bin/icmun $startdir/pkg/usr/bin/icmun
  install -m644 -D ../icmake.1 $startdir/pkg/usr/man/man1/icmake.1
}

md5sums=('dff5bb7e5570aaff9adff1bc1f9f630a' 'b52c8842ff571a7f57478069484d75c3')
