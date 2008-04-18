# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=gnome-themes-extras
pkgver=2.20
pkgrel=1
pkgdesc="Extra themes for GNOME2"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk-engines>=2.12.1' 'librsvg>=2.18.2')
makedepends=('perlxml')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-themes-extras/2.20/$pkgname-${pkgver}.tar.bz2)
md5sums=('830b27cb368e40c70b15288d2db12937')

build() {
  cd ${startdir}/src/$pkgname-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
