# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxfont
pkgver=1.3.2
pkgrel=1
pkgdesc="X11 font rasterisation library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libfontenc' 'freetype2>=2.3.5' 'fontsproto')
makedepends=('pkgconfig' 'xtrans' 'fontcacheproto' 'xproto')
options=('!libtool')
source=(${url}/archive/individual/lib/libXfont-${pkgver}.tar.bz2)
md5sums=('64f510ebf9679f3a97a3d633cbee4f50')

build() {
  cd ${startdir}/src/libXfont-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
