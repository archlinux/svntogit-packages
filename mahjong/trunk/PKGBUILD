# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>
pkgname=mahjong
pkgver=1.8
pkgrel=1
pkgdesc="The classical game of Mah Jongg (not the solitare version).  Includes network play"
depends=('gtk')
arch=('i686' 'x86_64')
license=('GPL' 'custom')
source=(http://www.stevens-bradfield.com/MahJong/Source/mj-$pkgver-src.tar.gz)
url="http://www.stevens-bradfield.com/MahJong/"
md5sums=('327379e386fea93b166dfe85b3d2f0c1')

build() {
   cd $startdir/src/mj-$pkgver-src
   make || return 1
   make DESTDIR=$startdir/pkg/usr/ install
   install -m644 -D tiles-v1/README \
           $startdir/pkg/usr/share/licenses/$pkgname/tiles-license.txt
}
