# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-idna
pkgname=('python-idna' 'python2-idna')
pkgver=2.9
pkgrel=1
pkgdesc="Internationalized Domain Names in Applications (IDNA)"
arch=('any')
license=('BSD')
url="https://github.com/kjd/idna"
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/i/idna/idna-$pkgver.tar.gz")
sha512sums=('2bd3fdae46fe7045640912872b0a3955de3abce62fd222b16ea2c997a04755acc834eeb645e5610d621c176d4b963e1d4a71228fba14efad54999cdf3c02eaf4')

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
