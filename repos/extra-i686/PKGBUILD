# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libfontenc
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 font encoding library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('zlib')
makedepends=('pkgconfig' 'xproto')
options=('nolibtool')
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5cd16a2e51ca7b96a3081c7486ff98b9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --with-encodingsdir=/usr/share/fonts/encodings
              
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
