# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=findutils
pkgver=4.2.33
pkgrel=1
pkgdesc="GNU utilities to locate files"
arch=(i686 x86_64)
license=('GPL')
groups=('base')
depends=('glibc')
url="http://www.gnu.org/software/findutils"
source=(ftp://ftp.gnu.org/pub/gnu/findutils/findutils-$pkgver.tar.gz)
md5sums=('b7e35aa175778c84942b1fee4144988b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  # believe it or not, the Makefile really wants to remove /usr/var, so
  # we let it...
  mkdir -p $startdir/pkg/usr/var
  make DESTDIR=$startdir/pkg install
  rm -rf $startdir/pkg/usr/libexec

  # remove locate utils (we use slocate instead)
  rm -f $startdir/pkg/usr/bin/{locate,updatedb}
  rm -f $startdir/pkg/usr/share/man/man1/{updatedb.1,locate.1}
  rm -f $startdir/pkg/usr/share/man/man5/locatedb.5
  rmdir $startdir/pkg/usr/var
}
