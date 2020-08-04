# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-hyperlink
pkgname=('python-hyperlink' 'python2-hyperlink')
pkgver=20.0.0
pkgrel=1
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
makedepends=('python-idna' 'python2-idna' 'python-setuptools' 'python2-setuptools' 'python2-typing')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/python-hyper/hyperlink/archive/v$pkgver.tar.gz")
sha512sums=('2a07b2ca895d9f0fe012653a45514746c65197b283f8dcc724a7077ab626696820279faed1a3483fe275b8b1054ac18cb6945a2894032ddf0deed1cf15a43580')

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
