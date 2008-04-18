# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=penguin-command
pkgver=1.6.10
pkgrel=1
pkgdesc="This is a clone of the classic 'Missile Command' Game"
depends=('libpng' 'sdl' 'sdl_mixer' 'sdl_image')
source=(http://umn.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://user.cs.tu-berlin.de/~karlb/penguin-command/index.html"
md5sums=('84ac5c85ea7d832b94e2ac1d5b363a43')

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
