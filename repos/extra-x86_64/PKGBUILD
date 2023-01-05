# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
pkgver=5.5.2
pkgrel=1
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
pkgdesc='Zope Interfaces for Python 3.x'
depends=('python-setuptools')
checkdepends=('python-zope-event' 'python-zope-testing')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('ecc20df9b84c91f7a03ce7be087abcd6288f77b2e04f6974ece5b86a222944baf0dc0a2aa49063c74dc7c4d47c474fd01f512c7686164806d48f360667581205')

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
