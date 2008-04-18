# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=cpio
pkgver=2.9
pkgrel=3
pkgdesc="A tool to copy files into or out of a cpio or tar archive"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/cpio"
groups=('base')
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/cpio/cpio-${pkgver}.tar.gz)
md5sums=('2bb997a33555d4dc79d45d0cdf02cedd')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/man
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/bin/mt ${startdir}/pkg/usr/man/man1/mt.1
  mv ${startdir}/pkg/usr/bin ${startdir}/pkg/bin
  rm -rf ${startdir}/pkg/usr/libexec
}
