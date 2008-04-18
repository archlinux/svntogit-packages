# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=mpck
pkgver=0.17
pkgrel=1
license=('GPL')
pkgdesc="Reads MP3 files and tries to determine if they are correct."
arch=("i686" "x86_64")
url="http://mpck.linuxonly.nl/"
depends=('glibc')
#source=($url/$pkgname-$pkgver.tar.gz)
source=("http://checkmate.linuxonly.nl/checkmate-$pkgver.tar.gz")

build() {
  cd $startdir/src/checkmate-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('a731bb0decdd65fa7b5464edbc2ebeda')
