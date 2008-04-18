# $Id$
# Maintainer: damir <damir@archlinux.org>
pkgname=pal
pkgver=0.3.4
pkgrel=2
pkgdesc="A command-line calendar program."
url="http://palcal.sourceforge.net"
depends=('glib2' 'readline' 'gettext')
source=(http://telia.dl.sourceforge.net/sourceforge/palcal/$pkgname-$pkgver.tgz)
md5sums=('86911792eace630a1c2e93846c27290c')

build() {
  cd $startdir/src/$pkgname-$pkgver/src
  sed -i "s:-O2 -Wall:${CFLAGS}:g" Makefile.defs
  make || return 1
  make DESTDIR=$startdir/pkg install-no-rm
}
