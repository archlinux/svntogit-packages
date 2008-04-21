# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xf86-video-unichrome
pkgver=0.2.6
pkgrel=8
pkgdesc="Unichrome video drivers for X.Org"
arch=(i686 x86_64)
url="http://unichrome.sf.net/"
depends=('unichrome-dri>=7.0.3')
makedepends=('pkgconfig' 'xorg-server>=1.4.0.90' 'xorg-util-macros' 'xf86driproto' \
             'glproto' 'mesa>=7.0.3' 'autoconf' 'automake' 'libtool')
options=('!libtool')
conflicts=('xf86-video-via' 'openchrome')
groups=('xorg-video-drivers')
source=(http://downloads.sf.net/unichrome/${pkgname}-${pkgver}.tar.gz
	fix-defines.patch)
md5sums=('fd81a739ae8145bb9729fa9665ef426c' '84142497ed91048bb2d0d082ce8a0229')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/fix-defines.patch || return 1
  ./autogen.sh --prefix=/usr \
               --enable-dri
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
