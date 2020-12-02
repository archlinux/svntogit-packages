# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgbase=python-pycparser
pkgname=(python-pycparser python2-pycparser)
pkgver=2.20
pkgrel=3
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
makedepends=('python-ply' 'python2-ply' 'python-setuptools' 'python2-setuptools')
arch=('any')
license=('BSD')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/eliben/pycparser/archive/release_v$pkgver.tar.gz")
sha512sums=('d2dc48727750ec0a80d5e3b0c9fba390c3647416a3e18cad59429edb9f55d043c7695c52301b037c93af5d96ffc85fcba7cd54d376abdb89e973759c59fa189d')

prepare() {
  cp -a pycparser-release_v$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python setup.py build
  cd pycparser
  python _build_tables.py

  cd "$srcdir"/pycparser-release_v$pkgver-py2
  python2 setup.py build
  cd pycparser
  python2 _build_tables.py
}

check() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python tests/all_tests.py

  cd "$srcdir"/pycparser-release_v$pkgver-py2
  python2 tests/all_tests.py
}

package_python-pycparser() {
  depends=('python-ply')

  cd pycparser-release_v$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pycparser() {
  depends=('python2-ply')

  cd pycparser-release_v$pkgver-py2

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
