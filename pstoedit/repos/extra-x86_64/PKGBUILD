# $Id$
# Contributor: Tobias Powalowski <t.powa@gmx.de>
# Maintainer: damir <damir@archlinux.org>

pkgname=pstoedit
pkgver=3.45
pkgrel=2
depends=("gcc-libs>=4.2.1" "plotutils>=2.5" "gd" "imagemagick>=6.4.0.2")
pkgdesc="translates PostScript and PDF graphics into other vector formats"
arch=("i686" "x86_64")
license=('GPL')
source=("http://puzzle.dl.sourceforge.net/sourceforge/pstoedit/pstoedit-$pkgver.tar.gz" "pstoedit-3.45-gcc-4.3.patch")
md5sums=('071efc64d9edf5d942b407348ac7451d' '97c5893859c98f446e3b47423dc851fd')
url="http://www.pstoedit.net/"
options=('!libtool' '!makeflags')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 < ../pstoedit-3.45-gcc-4.3.patch || return 1
  sed -i 's/-pedantic//' configure
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
