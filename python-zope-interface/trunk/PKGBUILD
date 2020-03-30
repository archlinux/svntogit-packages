# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgbase=python-zope-interface
pkgname=('python-zope-interface' 'python2-zope-interface')
pkgver=5.0.2
pkgrel=1
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
makedepends=('python-pip' 'python2-pip')
checkdepends=('python-zope-event' 'python2-zope-event' 'python-zope-testing' 'python2-zope-testing'
              'python-coverage' 'python2-coverage')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('3e7ae0b6f8410a5baa8ade4728dde45af262584d3057149070fe025ae544d22b980fe566b0f18ff2c247a91256b2f84f0a8fbd0656e6528476b538efdd2f2520')

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
  PYTHONPATH="$PWD/build/lib.linux-x86_64-3.8" python setup.py test

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
