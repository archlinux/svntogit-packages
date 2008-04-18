# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: James Rayner <james@archlinux.org>

pkgname=crimson
pkgver=0.5.2
pkgrel=1
pkgdesc="Crimson Fields is a tactical war game in the tradition of Battle Isle"
arch=(i686 x86_64)
license=("GPL")
depends=('sdl_mixer' 'sdl_ttf' 'sdl_net')
source=(http://crimson.seul.org/files/$pkgname-$pkgver.tar.bz2 )
url="http://crimson.seul.org"


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

md5sums=('a6024dd95c8767cee9907475bf827291')
