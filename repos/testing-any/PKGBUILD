# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-defusedxml
pkgname=("python-defusedxml" "python2-defusedxml")
pkgver=0.7.0
pkgrel=1
pkgdesc="XML bomb protection for Python stdlib modules"
arch=('any')
url='https://bitbucket.org/tiran/defusedxml'
license=('Python')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/d/defusedxml/defusedxml-$pkgver.tar.gz")
sha512sums=('c0cb788b1e3e55ca49c0d0c1fef8ae483d2bcb759d79e4c2db3bed21fedae5ecaaa5783356497687fe2dc8a341e01216712b85b3857f8ffb2cd05867b4a874ea')

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
