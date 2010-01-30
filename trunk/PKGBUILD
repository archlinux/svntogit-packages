# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xkeyboard-config
pkgver=1.8
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkb-utils')
makedepends=('intltool' 'pkgconfig')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${pkgver}.tar.bz2)
md5sums=('37ae41628cd2ce35d202d30b1820c8ba')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled" || return 1
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}
