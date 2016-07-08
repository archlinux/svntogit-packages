# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=python-six
pkgname=('python2-six' 'python-six')
pkgver=1.10.0
pkgrel=1
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="http://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('python' 'python2')
source=(http://pypi.python.org/packages/source/s/six/six-$pkgver.tar.gz)
md5sums=('34eed507548117b2ab523ab14b2f8b55')

build() {
  cd $srcdir
  cp -r six-$pkgver six2-$pkgver
}

check() {
  cd $srcdir/six-$pkgver 
  python3 setup.py check

  cd $srcdir/six2-$pkgver 
  python2 setup.py check
}

package_python-six() {
  depends=('python')
  cd $srcdir/six-$pkgver 
  python3 setup.py install --root "${pkgdir}" --optimize=1
  install -Dm644 "${srcdir}/six-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-six() {
  depends=('python2')
  cd $srcdir/six2-$pkgver 
  python2 setup.py install --root "${pkgdir}" --optimize=1
  install -Dm644 "${srcdir}/six-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
