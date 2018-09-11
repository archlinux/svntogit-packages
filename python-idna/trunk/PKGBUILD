# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-idna
pkgname=('python-idna' 'python2-idna')
pkgver=2.7
pkgrel=3
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('34ba985862e386243f43616586e53830177cf4ba0925b6054198dfa63c085ec5c6c5b54c2b3c0989bc768aacceeef76b84471e58a16183b960dc4b8812cd1c61')

prepare() {
   rm -r idna-$pkgver/*.egg-info
   cp -a idna-$pkgver{,-py2}
}

build() {
   cd "$srcdir"/idna-$pkgver
   python setup.py build
 
   cd "$srcdir"/idna-$pkgver-py2
   python2 setup.py build
}

check() {
   cd "$srcdir"/idna-$pkgver
   python setup.py test

   cd "$srcdir"/idna-$pkgver-py2
   python2 setup.py test
}
 
package_python-idna() {
   depends=('python')
 
   cd idna-$pkgver
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
 
package_python2-idna() {
   depends=('python2')
 
   cd idna-$pkgver-py2
   python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
   install -Dm644 LICENSE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.rst
}
