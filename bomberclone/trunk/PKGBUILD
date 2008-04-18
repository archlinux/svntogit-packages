# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=bomberclone
pkgver=0.11.8
pkgrel=1
pkgdesc="A Clone of the game AtomicBomberMan"
arch=(i686 x86_64)
url="http://www.bomberclone.de/"
license=('GPL')
depends=('sdl_mixer' 'sdl_image')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2\
	bomberclone.desktop)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 $startdir/src/bomberclone.desktop \
	$startdir/pkg/usr/share/applications/bomberclone.desktop
}

md5sums=('1dedd642120eee8911b12e2ee05e476f'
         'e05e10f65848165d317c4c24d0cd8759')
sha1sums=('a900b716683f9267bfd28d9687049e1f65335f95'
          '0d8c775a335935c3ad3c8508245a950a67f6b5f1')
