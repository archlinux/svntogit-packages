# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Mauricio Barrera <damage@damage.zero.org>

pkgname=colortail
pkgver=0.3.0
pkgrel=2
pkgdesc="Colortail is a log colorizer that I've made to make log checking easier"
arch=(i686 x86_64)
license=('GPL')
url="http://joakimandersson.se/projects/colortail/"
depends=('gcc')
source=(http://joakimandersson.se/files/$pkgname-$pkgver.tar.gz
        http://joakimandersson.se/files/$pkgname-$pkgver-gcc3.patch.gz)
md5sums=('2589d3e372080f4052d1cc0d6550508f' '504b3c31dde38bba11e2ee407e3225c4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  patch -p1 < ../$pkgname-$pkgver-gcc3.patch
  #patch -p1 < ../../ansi-c++-gcc-3.2.diff
  make || return 1
  make prefix=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/etc/colortail
  cp example-conf/conf.messages $startdir/pkg/etc/colortail
}
