# $Id$
# Contributor: Camille Moncelier <pix@devlife.org>

pkgname=m17n-lib
pkgver=1.3.4
pkgrel=1
pkgdesc="A multilingual text processing library (runtimes)"
arch=(i686 x86_64)
url="http://www.m17n.org/m17n-lib/"
license=("GPL")
depends=('libxft' 'libxaw' 'm17n-db>=1.3.4' 'fribidi' 'libxml2' 'gd' 'ispell' 'anthy')
source=(http://www.m17n.org/m17n-lib-download/$pkgname-$pkgver.tar.gz m17n-lib-1.3.1-fPIC.patch)

build() {
  cd $startdir/src/$pkgname-$pkgver

#  [ "$CARCH" == "x86_64" ] && patch -Np0 -i ../m17n-lib-1.3.1-fPIC.patch || return 1

  ./configure --prefix=/usr
  make
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

#The m17n library is configured with these external libraries.
#  fribidi freetype xft2 fontconfig gdlib xml2 anthy ispell

