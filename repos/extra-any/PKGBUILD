# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgbase=python-platformdirs
pkgname=(python-platformdirs python2-platformdirs)
pkgver=2.0.2
pkgrel=1
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir"'
arch=('any')
url="https://github.com/ActiveState/platformdirs"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/p/platformdirs/platformdirs-$pkgver.tar.gz")
sha512sums=('a342167cf10959b04535060dfffc11df42e046cfcf75c83c0eaa45ba314a864ff715f0764efd65aee5a404f39fe3c80a9f0fde6adf91b95cba7f508d01d09ab3')

prepare() {
  cp -a platformdirs-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py build

  cd "$srcdir"/platformdirs-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/platformdirs-$pkgver
  python setup.py test

  cd "$srcdir"/platformdirs-$pkgver-py2
  python2 setup.py test
}

package_python-platformdirs() {
  depends=('python')

  cd platformdirs-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python2-platformdirs() {
  depends=('python2')

  cd platformdirs-$pkgver-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
