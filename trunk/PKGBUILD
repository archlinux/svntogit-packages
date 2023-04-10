# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.4
pkgrel=3
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-flit-core')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('4060a9304c9bac04efdd0b97ec8f5aeb7e17417e767bf51c5dfc26605edad25ab67456cf6f6a3c5a9f32b8247e46f6343edfd8a6ffbcd6d1075c71e66d089d6a')

build() {
   cd idna-$pkgver
   python -m build --no-isolation --wheel
}

check() {
   cd idna-$pkgver
   pytest
}

package() {
   cd idna-$pkgver
   python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
