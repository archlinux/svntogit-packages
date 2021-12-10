# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.2.2
pkgrel=4
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-pyproject2setuppy')
checkdepends=('python-pytest' 'python-dateutil')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hukkin/tomli/archive/$pkgver.tar.gz")
sha512sums=('460ad8ae9a342d82ef12911c0d0e246c1434a5d40d898e91f6c05bf37b7bf9921da05e004c36907d623a797a7a215c1c3faf3f9a2b940f3867b142847a188605')

build() {
  cd tomli-$pkgver
  python -m pyproject2setuppy.main build
}

check() {
  cd tomli-$pkgver
  python -m pytest
}

package() {
  cd tomli-$pkgver
  python -m pyproject2setuppy.main install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
