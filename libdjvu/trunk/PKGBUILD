# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: mgushee

pkgname=libdjvu
pkgver=3.5.20
pkgrel=1
pkgdesc="Library to process DjVu ('déjà vu') documents"
arch=("i686" "x86_64")
license=('GPL')
url="http://djvu.sourceforge.net/"
depends=('gcc' 'libjpeg')
options=('!libtool')
source=(http://downloads.sourceforge.net/djvu/djvulibre-${pkgver}-2.tar.gz)
md5sums=('9211170b1ada6c75971d01353a73333e')

build() {
  cd ${startdir}/src/djvulibre-${pkgver}
  ./configure --prefix=/usr
  cd libdjvu
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
