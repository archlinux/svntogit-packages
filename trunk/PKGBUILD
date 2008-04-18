# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=gdbm
pkgver=1.8.3
pkgrel=5
pkgdesc="GNU database library"
url="http://www.gnu.org/software/gdbm/gdbm.html"
license=('GPL')
arch=(i686 x86_64)
groups=('base')
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz)
md5sums=('1d1b1d5c0245b1c00aff92da751e9aa1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make prefix=/usr || return 1
  make prefix=$startdir/pkg/usr install
  make prefix=$startdir/pkg/usr install-compat
  chown root.root $startdir/pkg/usr/include/{dbm.h,gdbm.h,ndbm.h}
  chown root.root $startdir/pkg/usr/man/man3/gdbm.3
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
