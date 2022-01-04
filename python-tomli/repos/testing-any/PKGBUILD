# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=2.0.0
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-pyproject2setuppy')
checkdepends=('python-pytest' 'python-dateutil')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hukkin/tomli/archive/$pkgver.tar.gz")
sha512sums=('dc7cdfadaca74f39dd6cb00686ec2e5b47b8ee3dbec9bd0a289a6ff78619cfdbf125adb6253d838f197722f4389690872a3ca870664b7785c19f3c2bb1a18231')

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
