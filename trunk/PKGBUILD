# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tobias Roettger <toroettg@gmail.com>

pkgbase=python-appdirs
pkgname=(python-appdirs python2-appdirs)
pkgver=1.4.3
pkgrel=2
pkgdesc='A small Python module for determining appropriate platform-specific dirs, e.g. a "user data dir".'
arch=('any')
url="https://github.com/ActiveState/appdirs"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/a/appdirs/appdirs-$pkgver.tar.gz")
md5sums=('44c679904082a2133f5566c8a0d3ab42')

prepare() {
  cp -a appdirs-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/appdirs-$pkgver
  python setup.py build

  cd "$srcdir"/appdirs-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/appdirs-$pkgver
  python setup.py test

  cd "$srcdir"/appdirs-$pkgver-py2
  python2 setup.py test
}

package_python-appdirs() {
  depends=('python')

  cd appdirs-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-appdirs() {
  depends=('python2')

  cd appdirs-$pkgver-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
