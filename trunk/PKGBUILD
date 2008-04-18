# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@juvepoland.com>
# Contributor: Stephen Caraher <moskvax@gmail.com>

pkgname=libiec61883
pkgver=1.1.0
pkgrel=1
pkgdesc="A higher level API for streaming DV, MPEG-2 and audio over Linux IEEE 1394"
arch=('i686' 'x86_64')
url="http://www.linux1394.org/"
license=('LGPL')
depends=('libraw1394')
options=('!libtool')
source=(http://www.linux1394.org/dl/$pkgname-$pkgver.tar.gz)
md5sums=('08f46840912ae2032499186228842a32')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
