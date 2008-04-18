# $Id$
# Maintainer: Judd <jvinet@zeroflux.org>

pkgname=bzip2
pkgver=1.0.5
pkgrel=2
pkgdesc="A high-quality data compression program"
arch=(i686 x86_64)
license=('custom')
url="http://sources.redhat.com/bzip2"
groups=('base')
depends=('glibc')
source=(http://www.bzip.org/$pkgver/bzip2-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/bin $startdir/pkg/usr/share/man/man1
  mkdir -p $startdir/pkg/usr/include $startdir/pkg/usr/lib
  mkdir -p $startdir/pkg/lib
  # add large-file support
  sed -e 's/^CFLAGS=\(.*\)$/CFLAGS=\1 \$(BIGFILES)/' -i ./Makefile-libbz2_so
  make -f Makefile-libbz2_so || return 1
  make bzip2recover libbz2.a || return 1
  ln -s libbz2.so.1.0.4 libbz2.so
  cp bzip2-shared $startdir/pkg/bin/bzip2
  cp bzip2recover $startdir/pkg/bin
  cp bzip2.1 $startdir/pkg/usr/share/man/man1
  mkdir -p $startdir/pkg/usr/include
  cp bzlib.h $startdir/pkg/usr/include
  cp -a libbz2.so* $startdir/pkg/lib
  rm -f $startdir/pkg/usr/lib/libbz2.a
  cp libbz2.a $startdir/pkg/usr/lib
  cd $startdir/pkg/usr/lib
  ln -sf ../../lib/libbz2.so
  cd $startdir/pkg/bin
  ln -sf bzip2 bunzip2
  ln -sf bzip2 bzcat
  cd $startdir/pkg/usr/share/man/man1
  ln -sf bzip2.1 bunzip2.1
  ln -sf bzip2.1 bzcat.1
  ln -sf bzip2.1 bzip2recover.1

  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('3c15a0c8d1d3ee1c46a1634d00617b1a')
