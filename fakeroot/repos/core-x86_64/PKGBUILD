# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
pkgname=fakeroot
pkgver=1.9.3
pkgrel=1
pkgdesc="Gives a fake root environment, useful for building packages as a non-privileged user"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/fakeroot"
groups=('base-devel')
install=fakeroot.install
depends=('glibc' 'filesystem' 'grep' 'sed')
options=('!libtool')
source=(http://ftp.debian.org/debian/pool/main/f/$pkgname/${pkgname}_${pkgver}.tar.gz)
md5sums=('d96c9bf27590d6da4215f0af998f1ee9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib/libfakeroot
  make || return 1
  make DESTDIR=$startdir/pkg install
}
