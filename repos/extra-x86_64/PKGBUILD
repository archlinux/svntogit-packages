# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=python-zope-interface
pkgver=5.4.0
pkgrel=4
license=('ZPL')
arch=('x86_64')
url="https://pypi.python.org/pypi/zope.interface"
pkgdesc='Zope Interfaces for Python 3.x'
depends=('python')
makedepends=('python-pip')
checkdepends=('python-zope-event' 'python-zope-testing'
              'python-coverage')
source=("https://pypi.io/packages/source/z/zope.interface/zope.interface-$pkgver.tar.gz")
sha512sums=('ef15d63397e05ad9fc44b2d5d786b0399b6973bb5f4866fab839ff612756f3157f2099d0f5c0469b574a5c8b5920a7c2a5c6eab8e8f84c24d5c43e816669bffe')

build() {
  cd "$srcdir"/zope.interface-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/zope.interface-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-x86_64-3.10" python setup.py test
}

package() {
  cd zope.interface-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
