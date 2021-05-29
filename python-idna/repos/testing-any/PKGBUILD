# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.2
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('2bc8e37abdc0570e5e13c9064f51630605806c3246a8d292511dad6f971610288212a2d881f9356ecb383f871e1477ccd60c4a5d6d7fd05254ff740d36543f35')

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
