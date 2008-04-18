# $Id$
# Maintainer: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=bumprace
pkgver=1.5.1
pkgrel=2
pkgdesc="BumpRace is a simple arcade game"
arch=(i686 x86_64)
depends=('sdl_image' 'sdl_mixer')
source=(http://user.cs.tu-berlin.de/~karlb/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://user.cs.tu-berlin.de/~karlb/news/"
md5sums=('4ed10dabae3feaba8596c4fa324a98f1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
