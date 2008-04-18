# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=potrace
pkgver=1.8
pkgrel=1
pkgdesc="A utility for tracing a bitmap. Input=portable bitmap (PBM) Output formats: EPS, PostScript, PDF, SVG, Xfig, GIMP-path, and PGM"
arch=("i686" "x86_64")
url="http://potrace.sourceforge.net/"
depends=('glibc' 'zlib')

source=(http://potrace.sourceforge.net/download/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

