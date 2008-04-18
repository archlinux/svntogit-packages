# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>

pkgname=libshout
pkgver=2.2.2
pkgrel=2
force=y
pkgdesc="Library for accessing a shoutcast/icecast server"
arch=(i686 x86_64)
depends=('libvorbis' 'libtheora' 'speex')
url="http://www.icecast.org/"
options=('NOLIBTOOL')
source=(http://downloads.xiph.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('4f75fc9901c724b712c371c9a1e782d3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make LDFLAGS+=-lspeex || return 1
  make DESTDIR=$startdir/pkg install
}
