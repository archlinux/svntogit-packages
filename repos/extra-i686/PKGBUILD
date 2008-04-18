# $Id$ 
# Maintainer: Dorphell
# Maintainer: Travis Willard <travisw@wmpub.ca> 
# Contributor: Arkamririon <Arkamririon@gmx.net>

pkgname=freealut
pkgver=1.1.0
pkgrel=2
pkgdesc="OpenAL Utility Toolkit (ALUT)"
arch=(i686 x86_64)
url="http://www.openal.org"
license="lgpl"
depends=('openal')
options=('!libtool')
makedepends=()
source=(http://www.openal.org/openal_webstf/downloads/$pkgname-$pkgver-src.zip)

build() {
  cd $startdir/src/$pkgname-$pkgver-src
  sh autogen.sh
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  # change cr-lf to -lf in script
  sed -i "s###g" $startdir/pkg/usr/bin/freealut-config
}

md5sums=('d8a587d847f1d5bebce67ad994c35e37')
