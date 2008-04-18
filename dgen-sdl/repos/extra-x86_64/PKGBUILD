# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=dgen-sdl
pkgver=1.23
pkgrel=22
pkgdesc=" DGen/SDL is a free, open source emulator for Sega Genesis/MegaDrive systems"
arch=(i686 x86_64)
depends=('sdl' 'nasm')
source=(http://www.pknet.com/~joe/$pkgname-$pkgver.tar.gz gcc4-dgen-sdl-1.23.patch)
# patch from http://www.mail-archive.com/debian-bugs-rc@lists.debian.org/msg17164.html

url="http://pknet.com/~joe/dgen-sdl.html"

build() {
cd $startdir/src/$pkgname-$pkgver

patch -p1 --verbose -i ../gcc4-dgen-sdl-1.23.patch || return 1
./configure --prefix=/usr --without-extra-opt

make -j1 || return 1
make prefix=$startdir/pkg/usr install
}
