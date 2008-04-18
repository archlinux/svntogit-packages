# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-games-extra-data
pkgver=2.20.0
pkgrel=1
pkgdesc="Optional extra data for gnome-games"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-games')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2)
md5sums=('adecbe76d2f45f6471b8bf0f6943f6ca')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
