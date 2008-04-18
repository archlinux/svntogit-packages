# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=m17n-db
pkgver=1.3.4
pkgrel=1
pkgdesc="A multilingual text processing library (database)"
arch=(i686 x86_64)
url="http://www.m17n.org/m17n-lib/"
license=GPL
depends=('glibc') # not because of compiling, but because of /usr/share/i18n/charmaps/ files that glibc provides
source=(http://www.m17n.org/m17n-lib-download/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

