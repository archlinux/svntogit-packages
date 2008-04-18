# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor orelien <aurelien.foret@wanadoo.fr>

pkgname=python-numeric
pkgver=24.2
pkgrel=2
pkgdesc="Numerical Python adds a fast array facility to the Python language."
arch=(i686 x86_64)
depends=('python>=2.5')
source=(http://heanet.dl.sourceforge.net/sourceforge/numpy/Numeric-${pkgver}.tar.gz)
replaces=('numeric')
url="http://numeric.scipy.org/"
md5sums=(2ae672656e06716a149acb048cca3093)

build() {
  cd ${startdir}/src/Numeric-${pkgver}
  python setup.py install --root=${startdir}/pkg
}
