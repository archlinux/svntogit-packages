# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-icon-theme
pkgver=2.22.0
pkgrel=1
pkgdesc="Default icon theme for GNOME2"
arch=(i686 x86_64)
depends=('hicolor-icon-theme' 'icon-naming-utils>=0.8.6')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-$pkgver.tar.bz2)
md5sums=('a4c03092da28ad53ed3867aef83f29d9')

build() {
  cd ${startdir}/src/${pkgname}-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
