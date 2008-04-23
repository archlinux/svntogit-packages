# $Id: $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libspectre
pkgver=0.2.0
pkgrel=1
pkgdesc="Small library for rendering Postscript documents"
arch=(i686 x86_64)
license=('GPL2')
url="http://libspectre.freedesktop.org/wiki/"
depends=('ghostscript')
options=('!libtool')
source=(http://libspectre.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('6dc4382d8c9cd355a76c4516f6e6f6e3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
