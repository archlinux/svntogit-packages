# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.0
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('2ed384e75fb3d873a19c6ee49915a48a757b3617227015f92f5e21b130cf30816ce3abf25d9ffd8931e080e645416fb0551b1be18a2d0233e02bce2e4b6556f3')

prepare() {
   rm -r idna-$pkgver/*.egg-info
}

build() {
   cd idna-$pkgver
   python setup.py build
}

check() {
   cd idna-$pkgver
   python setup.py test
}
 
package() {
   cd idna-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   #install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
