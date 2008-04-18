# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=sysvinit
pkgver=2.86
pkgrel=4
pkgdesc="Linux System V Init"
arch=(i686 x86_64)
license=('GPL')
groups=('base')
depends=('shadow' 'util-linux' 'coreutils' 'glibc' 'awk')
source=(ftp://ftp.cistron.nl/pub/people/miquels/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('7d5d61c026122ab791ac04c8a84db967')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cp src/init.c src/init.c.backup
  sed 's/\(.*\)\(Sending processes\)\(.*\)/\1\2 started by init\3/' \
     src/init.c > tmp~
  mv tmp~ src/init.c
  mkdir -p $startdir/pkg/bin $startdir/pkg/sbin
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/man/man5 $startdir/pkg/usr/man/man8
  mkdir -p $startdir/pkg/usr/man/man1 $startdir/pkg/usr/include
  make -C src || return 1
  make -C src MANDIR=/usr/man ROOT=$startdir/pkg install
}
