# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-pyspi
pkgver=0.6.1
pkgrel=2
pkgdesc="Python AT-SPI bindings"
arch=(i686 x86_64)
url="http://people.redhat.com/zcerza/dogtail"
license=(LGPL)
depends=('python' 'at-spi>=1.7.12')
makedepends=('pyrex')
conflicts=('pyspi')
provides=('pyspi')
replaces=('pyspi')
source=(http://people.redhat.com/zcerza/dogtail/releases/pyspi-${pkgver}.tar.gz)
md5sums=('def336bd566ea688a06ec03db7ccf1f4')

build() {
  cd ${startdir}/src/pyspi-${pkgver}
  python setup.py install --root=${startdir}/pkg
}
