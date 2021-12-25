# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgname=python-platformdirs
pkgver=2.4.0
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/platformdirs/platformdirs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('476f69a1bf91468f2d0285178adabf2f9fccc9abdb084008a7cce46535b1cc2e903511f8d02e03494ad9d26ccba81a0cce8e87e491ce3264582b01f6c93a2c7b')

build() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py test
}

package() {
  cd platformdirs-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
