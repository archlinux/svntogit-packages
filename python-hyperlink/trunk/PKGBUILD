# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-hyperlink
pkgname=('python-hyperlink' 'python2-hyperlink')
pkgver=19.0.0
pkgrel=4
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
makedepends=('python-idna' 'python2-idna' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/python-hyper/hyperlink/archive/v$pkgver.tar.gz")
sha512sums=('5a2848d55de1cd1373c140cf3063b4a32c944f4f762f27196a402095afcb65143551af55eab28926c794dc55b8337527266de4db377a635c18a477cd398cc3ee')

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

  cd "$srcdir"/hyperlink-$pkgver-py2
  python2 setup.py pytest
}

package_python-hyperlink() {
  depends=('python-idna')

  cd hyperlink-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-hyperlink() {
  depends=('python2-idna')

  cd hyperlink-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
