# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=wget
pkgver=1.11
pkgrel=1
pkgdesc="A network utility to retrieve files from the Web"
arch=(i686 x86_64)
url="http://www.gnu.org/software/wget/wget.html"
license=('GPL3')
groups=('base')
depends=('glibc' 'openssl')
backup=('etc/wgetrc')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b0a4d178672df06435fcbded07cfc054')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
