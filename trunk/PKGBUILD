# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-defusedxml
pkgname=("python-defusedxml" "python2-defusedxml")
pkgver=0.5.0
pkgrel=2
pkgdesc="XML bomb protection for Python stdlib modules"
arch=('any')
url='https://bitbucket.org/tiran/defusedxml'
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/d/defusedxml/defusedxml-$pkgver.tar.gz")
md5sums=('7ff1501366c6d1dcd2de8514dc2b755e')

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
