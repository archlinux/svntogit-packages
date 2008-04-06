# $Id: PKGBUILD,v 1.1 2005/05/02 21:58:19 damir Exp $
# Maintainer: damir <damir@archlinux.org>

pkgname=pngwriter
pkgver=0.5.3
pkgrel=1
pkgdesc="PNGwriter is a C++ library for creating PNG images"
url="http://pngwriter.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/pngwriter/$pkgname-$pkgver.tgz)

build() {
 cd $startdir/src/$pkgname-$pkgver
 make PREFIX=/usr || return 1
 make PREFIX=/usr \
      DESTDIR=$startdir/pkg  \
      install
}

