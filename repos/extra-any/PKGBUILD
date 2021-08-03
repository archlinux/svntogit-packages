# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.2.0
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-dephell' 'python-setuptools')
checkdepends=('python-pytest' 'python-dateutil')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('87b6069d026aa597774cbc87f3a7ad712905290e3c72cf123733abb1a6dc0ab5dc84f6b0eabc54b9f6de94091f7d2763bb4a56203f5ca2e292e202218e4fae37')

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
