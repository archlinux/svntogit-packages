# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.13
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(http://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('7b5be9f2b9a30102512b15308aec55f7f54289df24ac21de82ebb4bf145f9fce')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }
 
 package() { 
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
