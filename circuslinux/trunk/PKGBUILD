# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=circuslinux
pkgver=1.0.3
pkgrel=1
pkgdesc=" Circus Linux! is a clone of the Atari 2600 game Circus Atari"
depends=('sdl' 'sdl_image' 'sdl_mixer')
source=(ftp://ftp.sonic.net/pub/users/nbs/unix/x/circus-linux/$pkgname-$pkgver.tar.gz)
url="http://www.newbreedsoftware.com/circus-linux/"
build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
