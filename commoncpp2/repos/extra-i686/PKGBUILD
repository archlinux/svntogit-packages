# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=commoncpp2
pkgver=1.6.2
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
md5sums=('f564340284125bde66b43abb4aca2bf0')
sha1sums=('6291ff4182abef3fdf3b5f39cd306cdf24588cb6')
