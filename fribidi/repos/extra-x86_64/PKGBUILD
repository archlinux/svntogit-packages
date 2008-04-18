# $Id$
# Maintainer: Travis Willard <travis@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=fribidi
pkgver=0.10.9
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
arch=(i686 x86_64)
license=('LGPL')
url="http://fribidi.org"
depends=('glibc')
options=('!libtool')
source=(http://fribidi.org/download/fribidi-${pkgver}.tar.gz)
md5sums=('647aee89079b056269ff0918dc1c6d28')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

