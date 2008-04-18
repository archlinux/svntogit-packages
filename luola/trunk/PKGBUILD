# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=luola
pkgver=1.3.0
pkgrel=2
pkgdesc="A cavern-flying game for 1-4 players"
arch=(i686 x86_64)
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'sdl_gfx' 'sdl_mixer')
url="http://www.luolamies.org/software/luola/"
source=("$url/$pkgname-$pkgver.tar.gz" \
		"$url/stdlevels-6.0.tar.gz"
        "$url/nostalgia-1.2.tar.gz")
md5sums=('3bb6ad28882de3dcb17a0571ba4ed8f9'
         '7660b90d67c06726c1849c3ff0e24aea'
         '4777681fa97ada351ebaf954ba8451ef')

build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr --enable-sdl-gfx -enable-sound
make || return 1
make prefix=$startdir/pkg/usr install
cd $startdir/src
cp {*.png,*.lev} $startdir/pkg/usr/share/luola/levels
}

