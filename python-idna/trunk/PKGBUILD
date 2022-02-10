# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.3
pkgrel=4
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('70b7cc8718e7d7899c75cfe476f044eae5a2fa03801fc9c12e3a092627ca943ffc4a578f9b8a55e181a11564835e125cfaaa577c02a6461dbb97366e620e53ad')

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
   install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
