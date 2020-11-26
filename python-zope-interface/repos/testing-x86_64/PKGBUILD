# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgbase=python-zope-interface
pkgname=('python-zope-interface' 'python2-zope-interface')
pkgver=5.2.0
pkgrel=3
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
makedepends=('python-pip' 'python2-pip')
checkdepends=('python-zope-event' 'python2-zope-event' 'python-zope-testing' 'python2-zope-testing'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('64688b8a823d63fc78720ee15d59cc54c07a700dc45e46336cb23cd1a0a3eb998284a4d954d3fa08c7f26b35583c0284fb2fcd18f84f3133ce93f7c3ade0a988')

prepare() {
  cp -a zope.interface-${pkgver}{,-py2}
}

build() {
  cd "$srcdir"/zope.interface-$pkgver
  python setup.py build

  cd "$srcdir"/zope.interface-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/zope.interface-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-x86_64-3.9" python setup.py test

  cd "$srcdir"/zope.interface-$pkgver-py2
  PYTHONPATH="$PWD/build/lib.linux-x86_64-2.7" python2 setup.py test
}

package_python-zope-interface() {
  pkgdesc='Zope Interfaces for Python 3.x'
  depends=('python')

  cd zope.interface-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-zope-interface(){
  pkgdesc='Zope Interfaces for Python 2.x'
  depends=('python2')

  cd zope.interface-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
