# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
#

pkgname=apricots
pkgver=0.2.6
pkgrel=2
pkgdesc="A simple 2D flying/bombing game similar to basic side scrollers"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.fishies.org.uk/apricots.html"
depends=('gcc' 'openal>=0.0.8' 'sdl' 'freealut>=1.1.0')
source=("http://www.fishies.org.uk/$pkgname-$pkgver.tar.gz" \
	"apricots-0.2.6-freealut.patch")

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np0 -i $startdir/src/apricots-0.2.6-freealut.patch
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

md5sums=('910828d717e46d8cbd9c24f702d09fbc'
         '5f9f74082dfe162ab3ba51f6ec628f99')
