# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=commoncpp2
pkgver=1.6.0
pkgrel=1
pkgdesc="GNU Common C++ 2"
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/commoncpp/'
license=('GPL' 'custom')
depends=('gcc' 'bash')
options=('!libtool')
source=(http://ftp.gnu.org/pub/gnu/commoncpp/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 COPYING.addendum $startdir/pkg/usr/share/licenses/$pkgname/COPYING.addendum
}
md5sums=('638b1d025f831d576e746ece8e0a5887')
