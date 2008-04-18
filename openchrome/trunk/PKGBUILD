# $Id$
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Juergen Hoetzel <juergen@hoetzel.info>

pkgname=openchrome
pkgver=0.2.901
pkgrel=1
pkgdesc="Most developed drivers for Via Unichrome/Unichrome Pro under xorg"
arch=(i686 x86_64)
url="http://www.openchrome.org"
license=('MIT')
depends=('unichrome-dri')
makedepends=('pkgconfig' 'xorg-server>=1.1.1' 'xf86driproto' 'xorg-util-macros')
options=('!libtool' 'force')
conflicts=('xf86-video-via' 'xf86-video-unichrome')
source=(http://www.openchrome.org/releases/xf86-video-$pkgname-$pkgver.tar.gz LICENSE.txt)
md5sums=('103e63281e99d3024fb62e00e89d0892' 'addb3cf2671f4cf7e91156952de1627f')

build() {
  cd ${startdir}/src/xf86-video-${pkgname}-$pkgver || return 1
  ./configure --prefix=/usr || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 ../LICENSE.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.txt
}
