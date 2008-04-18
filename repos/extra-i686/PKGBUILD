# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mtools
pkgver=3.9.11
pkgrel=1
pkgdesc="A collection of utilities to access MS-DOS disks from Unix without mounting them"
url="http://mtools.linux.lu/"
source=(http://mtools.linux.lu/$pkgname-$pkgver.tar.gz)
arch=(i686 x86_64)
license=('GPL')
depends=('glibc')
makedepends=('texinfo')
md5sums=('3c0ae05b0d98a5d3bd06d3d72fcaf80d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --infodir=/usr/share/mtools --sysconfdir=/etc
  make || return 1
  make prefix=$startdir/pkg/usr infodir=$startdir/pkg/usr/share/mtools install
}
