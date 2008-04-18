# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=gtklife
pkgver=5.1
pkgrel=1
pkgdesc="GtkLife is a fast, featureful, open-source Conway's Life program for *nix"
arch=("i686" "x86_64")
depends=('gtk')
# url="http://www.igs.net/~tril/gtklife/"
url="http://ironphoenix.org/tril/gtklife/"

source=($url/$pkgname-$pkgver.tar.gz)
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
