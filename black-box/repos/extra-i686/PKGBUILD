# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=black-box
pkgver=1.4.7
pkgrel=1
pkgdesc="A game where You can shoot in and watch, where the shot leaves the box"
depends=('sdl_image' 'sdl_mixer')
source=(http://user.cs.tu-berlin.de/~karlb/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://user.cs.tu-berlin.de/~karlb/news/"
build() {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make prefix=$startdir/pkg/usr install
}
