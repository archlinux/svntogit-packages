# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgbase=python-pycparser
pkgname=(python-pycparser python2-pycparser)
pkgver=2.18
pkgrel=2
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
makedepends=('python-ply' 'python2-ply' 'python-setuptools' 'python2-setuptools')
arch=('any')
license=('BSD')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/eliben/pycparser/archive/release_v$pkgver.tar.gz")
sha512sums=('76426b000ed601a8e90a1eda34374b62acdf51dcf2048881ca0d4ebc3310e25728905c2f6843dd363d497b7cf0fd8311dab6c0de74f4a5c2f25d3b1d488f082a')

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
