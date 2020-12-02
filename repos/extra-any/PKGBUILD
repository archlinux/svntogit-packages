# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-idna
pkgname=('python-idna' 'python2-idna')
pkgver=2.10
pkgrel=3
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('83b412de2f79a4bc86fb4bdac7252521b9d84f0be54f4fb1bde1ee13a210bbfa4b1a98247affbc7921046fb117a591316c12694c1be72865767646554c5207ac')

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
