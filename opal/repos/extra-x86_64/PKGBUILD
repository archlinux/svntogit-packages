# $Id$
# Maintainer: Jan de Groot <jan@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>
pkgname=opal
pkgver=2.2.11
pkgrel=1
pkgdesc="Open Phone Abstraction Library"
arch=(i686 x86_64)
license=('GPL')
depends=('speex' 'pwlib>=1.10.10')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.2/${pkgname}-${pkgver}.tar.bz2)
url="http://www.ekiga.org"
md5sums=('b759033c85a1351e00ad1a29e4f50f26')

build() {
  cd ${startdir}/src/opal-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
