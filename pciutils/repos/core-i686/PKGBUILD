# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=pciutils
pkgver=2.2.8
pkgrel=3
pkgdesc="PCI bus configuration space access library and tools"
arch=(i686 x86_64)
license=('GPL2')
groups=('base')
url="http://atrey.karlin.mff.cuni.cz/~mj/pciutils.html"
makedepends=('wget')
depends=('glibc')
source=(ftp://ftp.kernel.org/pub/software/utils/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4d50c37e581351e82baefb55bdcc3966')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  CFLAGS="${CFLAGS} -fPIC -DPIC"
  sed -i -e 's/^OPT=.*/OPT=-O2 -pipe -fPIC -DPIC/g' Makefile
  ./update-pciids.sh

  make ZLIB=no PREFIX=/usr SHAREDIR=/usr/share/hwdata all || return 1
  make PREFIX=${startdir}/pkg/usr SHAREDIR=${startdir}/pkg/usr/share/hwdata install
  install -d ${startdir}/pkg/usr/lib
  install -m644 lib/libpci.a ${startdir}/pkg/usr/lib
  for i in config.h header.h pci.h types.h; do
    install -D -m 644 lib/${i} ${startdir}/pkg/usr/include/pci/${i}
  done
}
