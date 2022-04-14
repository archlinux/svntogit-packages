# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-automat
pkgver=20.2.0
pkgrel=9
arch=('any')
license=('MIT')
pkgdesc="Self-service finite-state machines for the programmer on the go."
url="https://github.com/glyph/automat"
depends=('python-attrs' 'python-six')
makedepends=('python-setuptools-scm' 'm2r')
checkdepends=('python-pytest' 'python-twisted' 'python-graphviz')
source=("https://github.com/glyph/automat/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ccba3e82f589fedb1f83dfb37a6a42b51a78d8c3e6fea22c9518135ff194f5f70e2f9c5f0eab50b6e116dae92c94754aac8dbf0e670a59015c916991736b4076')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd automat-$pkgver
  python setup.py build
}

check() {
  cd automat-$pkgver
  python -m pytest --deselect benchmark
}

package() {
  cd automat-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/python-automat/
}
