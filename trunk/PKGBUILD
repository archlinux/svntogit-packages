# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgbase=python-pyasn1
pkgname=('python-pyasn1' 'python2-pyasn1')
pkgver=0.4.5
pkgrel=1
arch=('any')
url="https://github.com/etingof/pyasn1"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
replaces=('pyasn1')
provides=('pyasn1')
source=(https://pypi.io/packages/source/p/pyasn1/pyasn1-$pkgver.tar.gz)
sha512sums=('8bacd1245a732b005f3a937f486920a348a9bd7d9af7828eb41d69712769f93fd09799e9cea1ad563f4b45c793246b8aecb96855d9deb223a8f2fb631f89dd8e')

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
