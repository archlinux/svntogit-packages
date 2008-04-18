# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=kobodeluxe
orgname=KoboDeluxe
pkgver=0.5.1
pkgrel=1
pkgdesc="kobodeluxe is an enhanced version of Akira Higuchi's game XKobo"
arch=('i686' 'x86_64')
url="http://www.olofson.net/kobodl/"
license=('GPL' 'LGPL')
depends=('gcc-libs' 'libjpeg' 'libpng' 'sdl' 'sdl_image' 'sdl_mixer')
source=(http://www.olofson.net/kobodl/download/$orgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$orgname-$pkgver
  ./configure --prefix=/usr --sharedstatedir=/usr/share/kobo-deluxe
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}

md5sums=('cf765559461213d651c7be042507b767')
