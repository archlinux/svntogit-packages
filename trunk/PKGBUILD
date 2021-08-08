# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.2.1
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-dephell' 'python-setuptools')
checkdepends=('python-pytest' 'python-dateutil')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('34f9529b137331b0ae03ac99170b3f6509847356594be14166bae306ea4fbbddff808ffe0c48d05434f72d223a2f35b511675217053029d287725b7142fbd089')

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
