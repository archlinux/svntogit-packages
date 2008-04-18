# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=smpeg
pkgver=0.4.4
pkgrel=3
pkgdesc="SDL MPEG Player Library"
arch=('i686' 'x86_64')
url="http://icculus.org/smpeg/"
license=('LGPL')
depends=('sdl')
makedepends=('gtk' 'mesa')
options=('!libtool' '!makeflags')
source=(http://mirrors.dotsrc.org/lokigames/open-source/smpeg/$pkgname-$pkgver.tar.gz smpeg-0.4.4-gcc41.patch)
md5sums=('59c76ac704088ef5539210190c4e1fe3' '8b979a58307d7196655758bd3d2466c4')
sha1sums=('6d7f4449472e6270ab435b2224f3fad951c35259' '7d9a2ad7f6b702dfe3adcb87601d9b55022bbd1e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 < ../smpeg-0.4.4-gcc41.patch
  ./configure --prefix=/usr
  make LDFLAGS+=-lstdc++ || return 1
  make DESTDIR=$startdir/pkg install
}
