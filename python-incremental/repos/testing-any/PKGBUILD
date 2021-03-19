# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-incremental
pkgname=('python-incremental' 'python2-incremental')
pkgver=21.3.0
pkgrel=1
pkgdesc='A small library that versions your Python projects'
arch=('any')
license=('MIT')
url='https://github.com/hawkowl/incremental'
makedepends=('python-setuptools' 'python2-setuptools' 'python-click' 'python2-click'
             'python-twisted' 'python2-twisted')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("https://github.com/hawkowl/incremental/archive/incremental-$pkgver.tar.gz")
sha512sums=('99a9e27b8513c4a13a74d37ae3d2c912af78ff9c6c528de1cba84767e2c08c9fc00cb54832efcccc70b922ac1582dd116cf8e8ba3f69926b424cf204ba4f0e7d')

prepare() {
  cp -a incremental-incremental-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/incremental-incremental-$pkgver
  python setup.py build

  cd "$srcdir"/incremental-incremental-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/incremental-incremental-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py ptr

  cd "$srcdir"/incremental-incremental-$pkgver-py2
  python2 setup.py ptr
}

package_python-incremental() {
  depends=('python-click' 'python-twisted')

  cd incremental-incremental-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-incremental() {
  depends=('python2-click' 'python2-twisted')

  cd incremental-incremental-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
