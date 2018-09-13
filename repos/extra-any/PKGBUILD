# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgbase=python-pyasn1
pkgname=('python-pyasn1' 'python2-pyasn1')
pkgver=0.4.4
pkgrel=1
arch=('any')
url="https://github.com/etingof/pyasn1"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
replaces=('pyasn1')
provides=('pyasn1')
source=(https://pypi.io/packages/source/p/pyasn1/pyasn1-$pkgver.tar.gz)
sha512sums=('ea2b73586a356aa9ea8cc9694328c2658da0f04cafceb0d13e278facf0870258391d595181932d294b6242cfedf2e82aea225580c4055ea3b1f47b930ba921d4')

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
