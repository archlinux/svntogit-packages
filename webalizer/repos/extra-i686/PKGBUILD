# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>

pkgname=webalizer
pkgver=2.01
pkgrel=4
pkgdesc="A web statistics generator with geolizer built in."
url="http://www.mrunix.net/webalizer/"
license="GPL"
arch=('i686')
depends=('gd' 'geoip')
makedepends=()
source=(ftp://ftp.mrunix.net/pub/webalizer/$pkgname-$pkgver-10-src.tgz \
        http://sysd.org/proj/geolizer_2.01-10-patch.20050520.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver-10
  patch -p1 < $startdir/src/geolizer_2.01-10-patch/geolizer.patch
  ./configure --prefix=/usr --enable-geoip
  make || return 1

  # Set up our directory structure
  install -d -m755 $startdir/pkg/usr/bin $startdir/pkg/usr/man/man1 \
                   $startdir/pkg/etc

  make prefix=$startdir/pkg/usr ETCDIR=$startdir/pkg/etc install
  cd $startdir/pkg/usr/bin
  rm -fr webazolver
  ln -s webalizer webazolver
}

md5sums=('9217595005aec46a505e1fb349052a8e'
	  '570bf2717be8981678dc9b4af2d321fb')
sha1sums=('b13bceac94b221b5435d45b142d30663d7399f40'
	  '61adea1082dee6ab683c0ffde48ea73897e540fc')
