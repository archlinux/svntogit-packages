# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=python-geoip
pkgver=1.2.1
pkgrel=2
pkgdesc="Python bindings for the GeoIP IP-to-country resolver library."
arch=(i686 x86_64)
url="http://www.maxmind.com/app/python"
depends=('python>=2.5' 'geoip')
source=(http://www.maxmind.com/download/geoip/api/python/GeoIP-Python-${pkgver}.tar.gz)
replaces=('geoip-python')
provides=('geoip-python')
md5sums=('5683420ea34490029ee0285ff048fda0')

build() {
  cd ${startdir}/src/GeoIP-Python-${pkgver}
  python setup.py build install --root=${startdir}/pkg
}
