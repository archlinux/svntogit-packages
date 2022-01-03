# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-tomli
pkgver=1.2.3
pkgrel=1
pkgdesc="A lil' TOML parser"
url="https://github.com/hukkin/tomli"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-pyproject2setuppy')
checkdepends=('python-pytest' 'python-dateutil')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hukkin/tomli/archive/$pkgver.tar.gz")
sha512sums=('270dbfe1df2e7f2692c35be5cc45e0b78e9e045e150fe959f4d6db8e3022126e7c17338636e57ba553fd928cbfd227938cfcd13128e1f05ee8cff29327594c61')

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
