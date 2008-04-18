# $Id$
# Maintainer: Alexander Baldeck <kth5@archlinux.org>
pkgname=xkeyboard-config
pkgver=1.2
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(i686 x86_64)
license=('custom')
url="http://www.freedesktop.org/wiki/Software/XKeyboardConfig"
depends=('xorg-xkb-utils')
makedepends=('perlxml' 'pkgconfig')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(http://xlibs.freedesktop.org/xkbdesc/xkeyboard-config-${pkgver}.tar.bz2)
md5sums=('667c582a54d5715d24110c20e8c4be38')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --with-xkb-base=/usr/share/X11/xkb \
              --with-xkb-rules-symlink=xorg \
              --enable-compat-rules=yes || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/share/X11/xkb/compiled || return 1
  install -m755 -d ${startdir}/pkg/var/lib/xkb
  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1
}
