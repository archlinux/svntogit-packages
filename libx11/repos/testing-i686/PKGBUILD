# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor Jan de Groot <jgc@archlinux.org>
pkgname=libx11
pkgver=1.1.4
pkgrel=1
pkgdesc="X11 client-side library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxau' 'libxdmcp' 'libxcb>=1.1' 'kbproto' 'inputproto' 'bigreqsproto')
makedepends=('pkgconfig' 'xcmiscproto' 'xextproto' 'xf86bigfontproto' 'xtrans' \
             'bigreqsproto' 'xorg-util-macros' 'autoconf' 'automake' 'libtool')
options=('!libtool')
license=('custom:XFREE86')
source=(${url}/releases/individual/lib/libX11-${pkgver}.tar.bz2
	012_ru_RU_UTF-8_XLC_LOCALE.diff
	xorg.sh)

build() {
  cd ${startdir}/src/libX11-${pkgver}
  patch -Np1 -i ${startdir}/src/012_ru_RU_UTF-8_XLC_LOCALE.diff || return 1


  libtoolize --force --copy
  autoreconf -fv

  ./configure --prefix=/usr \
              --with-xcb
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  mkdir -p ${startdir}/pkg/etc/profile.d 
  install -m755 ${startdir}/src/xorg.sh \
                ${startdir}/pkg/etc/profile.d/ || return 1

  install -m644 -D ${startdir}/src/libX11-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
md5sums=('1469a5a8aa8d288dce6f4c45d2f68dc3'
         'c7e38a68b932ed557bc71979eed2a8a1'
         'ea3f14c529072c8be061493763479800')
