# $Id$
# Maintainer: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Maintainer: eric <eric@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=gav
pkgver=0.9.0
pkgrel=1
pkgdesc="GPL Arcade Volleyball: an SDL remake of the old dos game Arcade Volleyball"
arch=(i686 x86_64)
depends=('sdl_image' 'sdl_net' 'libjpeg' 'libpng' 'zlib' 'gcc')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz $pkgname.patch)
url="http://gav.sourceforge.net/"
license=('GPL')
build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../$pkgname.patch
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,share/gav/themes}
  make ROOT=$startdir/pkg install
}
md5sums=('9cafad031ab15497c4a42f1b79fb3477'
         '438a7da2b71d1584e6353f4fb09905ce')
sha1sums=('7f1cc0a7bcac6fa92d89a3eacdfc6793dc0e8f6c'
          '700e71706e7e0907b2a8ad19ffd022ad5e543f7e')

# vim: ts=2 sw=2 et ft=sh
