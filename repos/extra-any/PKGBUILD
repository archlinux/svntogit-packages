# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-defusedxml
pkgname=("python-defusedxml" "python2-defusedxml")
pkgver=0.7.1
pkgrel=1
pkgdesc="XML bomb protection for Python stdlib modules"
arch=('any')
url='https://bitbucket.org/tiran/defusedxml'
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/d/defusedxml/defusedxml-$pkgver.tar.gz")
sha512sums=('93c1e077b22a278011497f3b3f4409b5259e0077768caa121e0f078f80f39c082f3870eaaf4bad5166fe8c3b2d169ccdea62c2840ba6969240a8371cef34c4d5')

prepare() {
  cp -a "defusedxml-$pkgver"{,-py2}
}

package_python-defusedxml() {
  depends=('python')

  cd defusedxml-$pkgver
  python3 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-defusedxml() {
  depends=('python2')

  cd defusedxml-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
