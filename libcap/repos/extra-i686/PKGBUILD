#$Id$
# Maintainer: Arjan Timmerman <arjan@archlinux.org>
pkgname=libcap
pkgver=1.10
pkgrel=2
pkgdesc="POSIX 1003.1e capabilities"
arch=(i686)
url="http://www.kernel.org/pub/linux/libs/security/linux-privs/"
license="GPL"
depends=('glibc')
source=(http://www.kernel.org/pub/linux/libs/security/linux-privs/kernel-2.4/${pkgname}-${pkgver}.tar.gz
	libcap-1.10-debian.patch)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/libcap-1.10-debian.patch || return 1
  make prefix=/usr DESTDIR=${startdir}/pkg install
  rmdir ${startdir}/pkg/usr/share/man/man2
}
