# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Étienne Deparis <etienne [at] depar.is>
# Contributor: Richard Quirk

pkgname=aha
pkgver=0.5.1
pkgrel=2
pkgdesc='Ansi HTML Adapter: convert ANSI escape sequences to HTML'
arch=(x86_64)
url='https://github.com/theZiz/aha'
license=(MPL LGPL)
depends=(glibc)
source=(https://github.com/theZiz/aha/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('6aea13487f6b5c3e453a447a67345f8095282f5acd97344466816b05ebd0b3b1')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
}
