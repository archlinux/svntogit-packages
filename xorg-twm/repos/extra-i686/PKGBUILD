# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xorg-twm
pkgver=1.0.1
pkgrel=2
pkgdesc="X Display Manager"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
backup=(etc/X11/twm/system.twmrc)
depends=('libxmu')
makedepends=('pkgconfig')
groups=('xorg')
_xorg=X11R7.0
_relname=twm
source=(${url}/releases/${_xorg}/src/everything/${_relname}-${_xorg}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${_relname}-${_xorg}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  mkdir -p ${startdir}/pkg/etc/X11/twm
  install -m 0644 src/system.twmrc ${startdir}/pkg/etc/X11/twm/
}

md5sums=('cd525ca3ac5e29d21a61deebc1e0c376')
