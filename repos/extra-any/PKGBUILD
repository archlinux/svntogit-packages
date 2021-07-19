# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.0.4
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-dephell' 'python-setuptools')
checkdepends=('python-pytest' 'python-dateutil')
source=("https://github.com/hukkin/tomli/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e30e06ea805c94359596c3d6db82464ccafcdde0172cae12d62c889c70986159b3198cf465183854bef1b048c21e487c2b0dad2825e2477d363885e749b238ee')

prepare() {
  cd tomli-$pkgver
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
