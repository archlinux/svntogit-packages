# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.1.0
pkgrel=2
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-dephell' 'python-setuptools')
checkdepends=('python-pytest' 'python-dateutil')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bd452d7a2ded403f3028ef66eb3dfa710f638e40a5737a23572538c1e3f6c6e17f74be4a41fa1b62b117e6d16f123a7f34eae9f221725fbd94eb7c8a5821838c')

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
