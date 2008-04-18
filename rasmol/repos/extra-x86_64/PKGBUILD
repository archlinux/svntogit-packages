# $Id$
# Maintainer :  Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=rasmol
pkgver=2.7.3
pkgrel=2
pkgdesc="A program for molecular graphics visualisation (aka openrasmol)"
url="http://www.openrasmol.org/"
depends=('glibc' 'libxi' 'libx11' 'libxext')
makedepends=('imake')
source=("ftp://ftp.bernstein-plus-sons.com/software/RasMol_$pkgver.tar.gz" \
	"$pkgname.png" \
	"$pkgname.desktop")
install=$pkgname.install

build() {
   cd $startdir/src/RasMol_$pkgver/src
   mkdir doc data
   gunzip -c ../doc/rasmol.1.gz > doc/rasmol.1
   cp ../data/*.pdb data
   xmkmf
   make all || return 1
   make DESTDIR=$startdir/pkg install
  # make it nice:
  install -D -m644 $startdir/src/$pkgname.png \
  $startdir/pkg/usr/share/pixmaps/$pkgname.png
  install -D -m644 $startdir/src/$pkgname.desktop \
  $startdir/pkg/usr/share/applications/$pkgname.desktop
}

