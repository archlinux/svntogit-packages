# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=geoip
pkgver=1.4.3
pkgrel=1
pkgdesc="Non-DNS IP-to-country resolver C library & utils"
arch=(i686 x86_64)
license=('GPL')
url="http://www.maxmind.com/app/c"
depends=('zlib')
backup=(etc/geoip/GeoIP.conf)
options=('!libtool')
source=(http://www.maxmind.com/download/geoip/api/c/GeoIP-${pkgver}.tar.gz)
md5sums=('d364ec127a1092749d589a79001f2d8c')

build() {
  cd ${startdir}/src/GeoIP-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc/geoip
  make || return 1
  make check || return 1
  make DESTDIR=${startdir}/pkg install
}
