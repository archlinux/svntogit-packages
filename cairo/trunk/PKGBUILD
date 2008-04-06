# $Id: PKGBUILD,v 1.26 2008/02/04 21:48:50 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Brice Carpentier <brice@daknet.org>

pkgname=cairo
pkgver=1.4.14
pkgrel=1
pkgdesc="Cairo vector graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
url="http://cairographics.org/"
depends=('libpng' 'libxrender' 'fontconfig')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://cairographics.org/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('e8c442ff821c0719a69508fecba9038f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
