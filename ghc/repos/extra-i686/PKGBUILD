# $Id$
# Maintainer: Simo Leone <simo@archlinux.org>
pkgname=ghc
pkgver=6.8.2
pkgrel=1
pkgdesc="A state-of-the-art, open source, compiler and interactive environment for Haskell."
arch=(i686 x86_64)
url="http://www.haskell.org/ghc/"
license=""
depends=('gmp' 'perl' 'readline')
makedepends=('ghc' 'happy')
source=("http://www.haskell.org/ghc/dist/$pkgver/$pkgname-$pkgver-src.tar.bz2" \
    "http://www.haskell.org/ghc/dist/$pkgver/ghc-$pkgver-src-extralibs.tar.bz2")
md5sums=('43108417594be7eba0918c459e871e40'
         'd199c50814188fb77355d41058b8613c')

build() {
  #since this is a compiler, it needs itself to compile
  #installer automatically bootstraps itself, so this actually compiles twice
  #In order to compile, you need ghc installed on your system
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make -j1 || return 1
  make DESTDIR=$startdir/pkg install
}
