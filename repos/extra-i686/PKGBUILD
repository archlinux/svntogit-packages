# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=ocaml	
pkgver=3.10.2
pkgrel=1
pkgdesc="Ocaml compiler - Ocaml is a functional language with OO extensions"
arch=(i686 x86_64)
license=('LGPL2' 'QPL-1.0')
url="http://caml.inria.fr/"
depends=('gdbm')
makedepends=('tk' 'ncurses' 'libx11')
source=(http://caml.inria.fr/distrib/ocaml-3.10/$pkgname-$pkgver.tar.gz)
install=(ocaml.install)
options=(!makeflags)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure -prefix /usr
  make world.opt
  make PREFIX=$startdir/pkg/usr install   
# Save >10MB with this one, makepkg only strips debug symbols.
 find ${startdir}/pkg/usr/lib -type f -name '*.so.*' -exec strip --strip-unneeded {} \;
# install license
install -D -m 644 $startdir/src/$pkgname-$pkgver/LICENSE $startdir/pkg/usr/share/licenses/ocaml/LICENSE
}
md5sums=('52c795592c90ecb15c2c4754f04eeff4')
