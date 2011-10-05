# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xkeyboard-config
pkgver=2.4.1
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkbcomp')
makedepends=('intltool')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(http://xorg.freedesktop.org/releases/individual/data/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('f048bdd6e3d71c621b5a47a7ee72d691eda1922e0e07808b157b292e0c857a0a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"
  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
