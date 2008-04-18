# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=csup
pkgver=20060318
pkgrel=5
pkgdesc="csup - cvsup rewritten in C"
arch=(i686 x86_64)
url="http://www.mu.org/~mux/csup.html"
license=('BSD')
groups=('base-devel')
depends=('gcc-libs' 'zlib' 'openssl')
provides=('cvsup')
replaces=('cvsup')
source=("http://www.mu.org/~mux/$pkgname-snap-$pkgver.tgz" COPYING)
md5sums=('9218f06f13ed28d1086eec413a734915'
         '26a03bbffa4a306e5fe1979aed1354be')

build() {
  cd $startdir/src/$pkgname
  make -f GNUmakefile || return 1
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/man/man1
  install -o 0 -g 0 csup $startdir/pkg/usr/bin/csup
  install -o 0 -g 0 csup.1.gz $startdir/pkg/usr/share/man/man1
  # install license
  mkdir -p $startdir/pkg/usr/share/licenses/csup
  install -m644 $startdir/src/COPYING $startdir/pkg/usr/share/licenses/csup/
}

