# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
pkgver=5.5.1
pkgrel=1
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
pkgdesc='Zope Interfaces for Python 3.x'
depends=('python-setuptools')
checkdepends=('python-zope-event' 'python-zope-testing')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('e5d73a78a8d9960cf8f24a7603175b0ebe0f2a3695536cdcecb5f78a6ee118aaa8fdf26c70d08a9d17f70e9b89024c260c732e2f9c9153ab960f3175fc10b9df')

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
