# $Id$
# Maintainer: simo <simo@archlinux.org>
# Contributor: Vesa Kaihlavirta <vegai@iki.fi>
 
pkgname=happy
pkgver=1.17
pkgrel=1
pkgdesc="The Parser Generator for Haskell"
url="http://www.haskell.org/happy/"
arch=('i686' 'x86_64')
license=("BSD")
depends=(gmp bash)
makedepends=(ghc)
conflicts=()
replaces=()
backup=()
install=
source=(http://www.haskell.org/$pkgname/dist/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('4bc931a8630ecebb751a2a8e60219313')

build() {
  cd "$startdir/src/${pkgname}-${pkgver}"
  # Configure package
  ./Setup.lhs configure --prefix=/usr || return 1
  # Build package
  ./Setup.lhs build || return 1
  # Install package
  ./Setup.lhs copy --copy-prefix=$startdir/pkg/usr
  # Install license
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
