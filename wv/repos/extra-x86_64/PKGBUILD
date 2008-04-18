# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=wv
pkgver=1.2.4
pkgrel=1
pkgdesc="MSWord library can load and parse Word 2000, 97, 95 and 6 file formats"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/wvware"
license=(GPL)
depends=('libgsf>=1.14.3' 'libpng>=1.2.13')
makedepends=('pkgconfig')
options=('nolibtool')
source=(http://heanet.dl.sf.net/sourceforge/wvware/${pkgname}-${pkgver}.tar.gz)
md5sums=('c1861c560491f121e12917fa76970ac5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
