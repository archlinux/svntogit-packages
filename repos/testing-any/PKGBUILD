# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-incremental
pkgver=22.10.0
pkgrel=3
pkgdesc='A small library that versions your Python projects'
arch=('any')
license=('MIT')
depends=('python-click' 'python-setuptools' 'python-twisted')
url='https://github.com/hawkowl/incremental'
checkdepends=('python-pytest')
source=("https://github.com/hawkowl/incremental/archive/incremental-$pkgver.tar.gz")
sha512sums=('fbc0b123038341a788789aa513c93dfa08592881ea89aafebdd5b21917a9888f7a7d54d7765c105eb362559391ef45f15d8ef98278b0e75c84fce7d83febf5f0')

build() {
  cd incremental-incremental-$pkgver
  python setup.py build
}

check() {
  cd incremental-incremental-$pkgver
  pytest
}

package() {
  cd incremental-incremental-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
