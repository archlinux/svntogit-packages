# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=desktop-file-utils
pkgver=0.14
pkgrel=1
pkgdesc="Freedesktop.org .desktop utils"
arch=(i686 x86_64)
license=('GPL')
depends=('glib2')
url="http://freedesktop.org/software/desktop-file-utils"
source=($url/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('e0b5057a4e3166f34635ac6f27c712c0')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

