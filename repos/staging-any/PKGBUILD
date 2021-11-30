# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: lang2 <wenzhi.liang@gmail.com>

pkgname=python-pycparser
pkgver=2.21
pkgrel=2
pkgdesc='C parser and AST generator written in Python'
url='https://github.com/eliben/pycparser'
depends=('python-ply')
makedepends=('python-setuptools')
arch=('any')
license=('BSD')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eliben/pycparser/archive/release_v$pkgver.tar.gz")
sha512sums=('b141e14040774ddaae6cd1726b0b2a61bfa76e8bcb5dc25dd99a303c48c7257dd7214cc7704234b0045ccc6a47354f6a7639647d875e1266846659217cc6ea78')

build() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python setup.py build
  cd pycparser
  python _build_tables.py
}

check() {
  cd "$srcdir"/pycparser-release_v$pkgver
  python -m unittest discover
}

package() {
  cd pycparser-release_v$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
