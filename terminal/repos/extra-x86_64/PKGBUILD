# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=terminal
pkgver=0.2.8
pkgrel=1
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/projects/terminal/"
groups=('xfce4')
depends=('exo>=0.3.4' 'vte>=0.16.9' 'dbus-glib' 'startup-notification>=0.9' \
         'hicolor-icon-theme')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-4.4.2/src/Terminal-${pkgver}.tar.bz2)
md5sums=('cfe660ecf50e9d3b073576bbc4af6ab2')

build() {
  cd ${startdir}/src/Terminal-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
