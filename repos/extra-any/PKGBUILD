# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-hyperlink
pkgname=('python-hyperlink' 'python2-hyperlink')
pkgver=20.0.1
pkgrel=3
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
makedepends=('python-idna' 'python2-idna' 'python-setuptools' 'python2-setuptools' 'python2-typing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/python-hyper/hyperlink/archive/v$pkgver.tar.gz")
sha512sums=('d13ae244f9d7876c41ece4e887a92a22bac8083d1f76d2c909fc7fb38fb2adbe0d4bd58b0175b03323ee55abde2f07c0dc173a4533c51dcfc80cf135caae88b2')

prepare() {
  cp -a hyperlink-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/hyperlink-$pkgver
  python setup.py build

  cd "$srcdir"/hyperlink-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/hyperlink-$pkgver
  python setup.py pytest

  # clean-up non-reproducible files generated during test
  rm -rf hyperlink/test/__pycache__/

  cd "$srcdir"/hyperlink-$pkgver-py2
  python2 setup.py pytest
}

package_python-hyperlink() {
  depends=('python-idna')

  cd hyperlink-$pkgver

  # reproducible .pyc files
  export PYTHONHASHSEED=0

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-hyperlink() {
  depends=('python2-idna' 'python2-typing')

  cd hyperlink-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
