# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python-chardet
pkgver=5.1.0
pkgrel=3
arch=('any')
url="https://github.com/chardet/chardet"
license=('LGPL')
depends=('python')
pkgdesc="Python3 module for character encoding auto-detection"
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/c/chardet/chardet-${pkgver}.tar.gz")
sha512sums=('f4e668de1d6f8fe0223d79a150123b99875cc5e2015e2b6c4052c1c545c044f1a3aba1c02eba3c295c0a1795e24302f5304500321dca8f1e8c0605d08ef8bb62')

build() {
   cd chardet-$pkgver
   python -m build --wheel --no-isolation
}

check() {
   cd chardet-$pkgver
   python -m pytest
}

package() {
   cd chardet-$pkgver
   python -m installer --destdir="$pkgdir" dist/*.whl
}
