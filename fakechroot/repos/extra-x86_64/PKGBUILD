# $Id$
# Maintainer : Aaron Griffin <aaron@archlinux.org>

pkgname=fakechroot
pkgver=2.5
pkgrel=2
pkgdesc="gives a fake chroot environment"
arch=(i686 x86_64)
url="http://fakechroot.alioth.debian.org"
install=fakechroot.install
depends=('glibc')
source=(http://ftp.debian.org/debian/pool/main/f/$pkgname/${pkgname}_$pkgver.orig.tar.gz)
md5sums=('b885951b98f4316f9686699e9853513d')
options=('nolibtool')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib/libfakeroot
  make || return 1
  make DESTDIR=$startdir/pkg install
}
