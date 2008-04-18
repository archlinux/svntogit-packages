# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=rarian
pkgver=0.8.0
pkgrel=1
pkgdesc="Documentation meta-data library, designed as a replacement for Scrollkeeper."
arch=('i686' 'x86_64')
url="http://rarian.freedesktop.org/"
license=('GPL')
depends=('gcc-libs')
makedepends=('libxslt')
conflicts=('scrollkeeper')
provides=('scrollkeeper')
replaces=('scrollkeeper')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.8/${pkgname}-${pkgver}.tar.bz2)
md5sums=('67e2d3ab27edcebdae9b85733712805e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
     --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
