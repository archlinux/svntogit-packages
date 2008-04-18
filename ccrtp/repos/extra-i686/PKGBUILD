# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ccrtp
pkgver=1.5.1
pkgrel=2
pkgdesc="GNU ccRTP"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ccrtp"
license=('GPL' 'custom')
depends=('commoncpp2' 'zlib' 'libxml2' 'libgcrypt')
options=('!libtool')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('728c41edd62be2871eac50be287f97ee')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # arch64 fix from Mandriva
  [ "$CARCH" == "x86_64" ] && export CXXFLAGS="$CXXFLAGS -fpermissive"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 COPYING.addendum $startdir/pkg/usr/share/licenses/$pkgname/COPYING.addendum
}
