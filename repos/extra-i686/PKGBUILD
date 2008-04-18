# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=lablgtk2
pkgver=2.10.1
pkgrel=1
pkgdesc=" An Objective Caml interface to gtk2"
arch=(i686 x86_64)
license=('LGPL2')
url="http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/lablgtk.html"
depends=('gtk2' 'gtkspell' 'libgnomecanvas' 'librsvg')
makedepends=('ocaml')
source=(http://wwwfun.kurims.kyoto-u.ac.jp/soft/olabl/dist/lablgtk-$pkgver.tar.gz)

# uninstall libgnomeui before to avoid gnome depends
build() {
  cd $startdir/src/lablgtk-$pkgver
  ./configure
  make  || return 1
  make opt  || return 1
  make  PREFIX=$startdir/pkg/usr LIBDIR=$startdir/pkg/usr/lib/ocaml BINDIR=$startdir/pkg/usr/bin INSTALLDIR=$startdir/pkg/usr/lib/ocaml/lablgtk2 DLLDIR=$startdir/pkg/usr/lib/ocaml/stublibs install || return 1
rm -r $startdir/pkg/usr/bin
}
md5sums=('bd7073ca05e684e5d5a3d553371fd6e5')
