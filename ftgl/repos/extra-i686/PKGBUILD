# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
pkgname=ftgl
pkgver=2.1.2
pkgrel=3
pkgdesc="OpenGL library to use arbitrary fonts"
arch=(i686 x86_64)
source=(http://opengl.geek.nz/ftgl/$pkgname-$pkgver.tar.gz ftgl-gcc411.patch)
url="http://homepages.paradise.net.nz/henryj/code/"
options=(NOLIBTOOL)
depends=(freetype2 glut)
makedepends=(doxygen)

build() {
  cd $startdir/src/FTGL/
  patch -Np1 -i ${startdir}/src/ftgl-gcc411.patch || return 1
  cd unix
  sed -i 's|^    \$|	$|g' src/Makefile
  ./configure --prefix=/usr --with-pic
  make || return 1
  make prefix=$startdir/pkg/usr install

}
md5sums=('3eabec9ad37371c4d139408c7ffd2429' '2a4ad16c1bfae869a8bf0ddababfd25a')
