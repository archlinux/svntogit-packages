# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.2.2
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-dephell' 'python-setuptools')
checkdepends=('python-pytest' 'python-dateutil')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('460ad8ae9a342d82ef12911c0d0e246c1434a5d40d898e91f6c05bf37b7bf9921da05e004c36907d623a797a7a215c1c3faf3f9a2b940f3867b142847a188605')

prepare() {
  cd tomli-$pkgver
  # flit is not needed at runtime
  sed -i '/flit_core/d' pyproject.toml
  dephell deps convert --from pyproject.toml --to setup.py
}

build() {
  cd tomli-$pkgver
  python setup.py build
}

check() {
  cd tomli-$pkgver
  python -m pytest
}

package() {
  cd tomli-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
