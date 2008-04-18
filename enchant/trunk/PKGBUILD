# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=enchant
pkgver=1.3.0
pkgrel=1
pkgdesc="A wrapper library for generic spell checking"
arch=(i686 x86_64)
depends=('aspell' 'glib2')
options=(NOLIBTOOL)
source=(http://www.abisource.com/downloads/enchant/${pkgver}/${pkgname}-${pkgver}.tar.gz)
url="http://www.abisource.com/enchant/"
md5sums=('f7edafae875616b83e7a17a7e5c2d585')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
