# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xkeyboard-config
pkgver=1.9
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
source=(http://people.freedesktop.org/~svu/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1fe14114db8e4f121060663d1fa5e214')

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
