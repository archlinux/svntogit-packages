# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-idna
pkgver=3.1
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('23c02520d00a99855d552a9b9def529f0baeec7d27e8036c544dd654ade15243fd5c9e5ad02e73b83a9ca3bb335ab2584233d17345a6a5e6d5ac089e8ac81e8a')

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
