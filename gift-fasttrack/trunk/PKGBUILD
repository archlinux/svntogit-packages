# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=gift-fasttrack
pkgver=0.8.9
pkgrel=3
pkgdesc="A FastTrack plugin for giFT."
url="http://developer.berlios.de/projects/gift-fasttrack"
depends=('gift')
source=(http://download.berlios.de/$pkgname/giFT-FastTrack-$pkgver.tar.gz)
md5sums=('68521847537985bcc5e9b8677343374c')
install=fasttrack.install

build() {
  cd $startdir/src/giFT-FastTrack-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
