# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
pkgver=5.5.0
pkgrel=1
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
pkgdesc='Zope Interfaces for Python 3.x'
depends=('python-setuptools')
checkdepends=('python-zope-event' 'python-zope-testing')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('ab74a55a90c17b1aed55f1d6e24365321ebbca5943557be7731af99d7436f18f4d0a4c53c0c26c29c0379ce72ef0c2babccaa9cad5aec843bc533ff19fdbe6d9')

prepare() {
  cd zope.interface-$pkgver
  sed -i '/coverage/d' setup.py
}

build() {
  cd zope.interface-$pkgver
  python setup.py build
}

check() {
  cd zope.interface-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-310" python setup.py test
}

package() {
  cd zope.interface-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
