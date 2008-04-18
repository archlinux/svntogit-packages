# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=reiserfsprogs
pkgver=3.6.20
pkgrel=3
pkgdesc="Reiserfs utilities"
arch=(i686 x86_64)
url="http://www.namesys.com"
license=('GPL')
groups=('base')
depends=('e2fsprogs')
source=(ftp://ftp.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz
	#namesys server is down atm
	#ftp://ftp.namesys.com/pub/$pkgname/$pkgname-$pkgver.tar.gz
)
md5sums=('3b3392f59c5d302cf858bc4cf194b258')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/usr/sbin $startdir/pkg
  #ln -s reiserfsck $startdir/pkg/sbin/fsck.reiserfs
}
