# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=lablgtk
pkgver=1.2.7
pkgrel=6
pkgdesc=" An Objective Caml interface to gtk+"
arch=(i686 x86_64)
url="http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgtk.html"
depends=('gtk')
makedepends=('ocaml')
source=(http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  make configure
  make
  make opt
  make  PREFIX=$startdir/pkg/usr LIBDIR=$startdir/pkg/usr/lib/ocaml BINDIR=$startdir/pkg/usr/bin INSTALLDIR=$startdir/pkg/usr/lib/ocaml/lablgtk DLLDIR=$startdir/pkg/usr/lib/ocaml/stublibs install
rm -r $startdir/pkg/usr/bin
}
md5sums=('73a797e3a459190fdcaa8288935f6fb9')
