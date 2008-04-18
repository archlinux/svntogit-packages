# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>

pkgname=iperf
pkgver=2.0.2
pkgrel=2
pkgdesc="a tool to measure maximum TCP bandwidth"
arch=(i686 x86_64)
license=('custom')
url="http://dast.nlanr.net/Projects/Iperf/"
depends=(gcc)
source=(http://dast.nlanr.net/Projects/Iperf2.0/${pkgname}-${pkgver}.tar.gz
	license)
md5sums=('bb658aba58a5af0356f5b1342dfe8f53' 'a2879f900b76668b28a1cc922909db18')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/licenses/iperf
  install -m644 ${startdir}/src/license ${startdir}/pkg/usr/share/licenses/iperf/license.txt
}
