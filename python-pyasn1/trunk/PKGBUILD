# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgbase=python-pyasn1
pkgname=('python-pyasn1' 'python2-pyasn1')
pkgver=0.4.6
pkgrel=1
arch=('any')
url="https://github.com/etingof/pyasn1"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
replaces=('pyasn1')
provides=('pyasn1')
source=(https://pypi.io/packages/source/p/pyasn1/pyasn1-$pkgver.tar.gz)
sha512sums=('0d7dba175f292a136a34df0dadb90392bff1dac93ab2d04697fcd3e03f5bb8367a8e68dbfcc536ea9effd6292a459f24766f29f512161724fa405accb86617c5')

check() {
  cd pyasn1-${pkgver}
  python2 setup.py test
  python setup.py test
}

package_python-pyasn1() {
  pkgdesc="ASN.1 library for Python 3"
  depends=('python')

  cd pyasn1-${pkgver}
  python setup.py install --root="${pkgdir}"
  install -D -m 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pyasn1() {
  pkgdesc="ASN.1 library for Python 2"
  depends=('python2')

  cd pyasn1-${pkgver}
  python2 setup.py install --root="${pkgdir}"
  install -D -m 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
