# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=alsa-oss
pkgver=1.0.15
pkgrel=1
pkgdesc="OSS compatibility library"
arch=(i686 x86_64)
license=('GPL')
url="http://www.alsa-project.org"
options=(!libtool)
depends=('glibc' 'alsa-lib>=1.0.15')
source=(ftp://ftp.alsa-project.org/pub/oss-lib/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('49fb5fbae8bf955b248e46ff9c9a2aa1')
