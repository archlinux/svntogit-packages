# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=lame
pkgver=3.97
pkgrel=1
pkgdesc="An MP3 encoder and graphical frame analyzer"
arch=(i686 x86_64)
url="http://lame.sourceforge.net/"
depends=('ncurses')
makedepends=('nasm')
source=(http://heanet.dl.sourceforge.net/sourceforge/lame/lame-$pkgver.tar.gz \
	shared-frontend.patch)
md5sums=('90a4acbb730d150dfe80de145126eef7' 'e7fc0e6d82dd35a01411be96fc8effab')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i $startdir/src/shared-frontend.patch || return 1
  ./configure --prefix=/usr --enable-nasm \
	--enable-shared --enable-mp3rtp
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
