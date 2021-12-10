# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=python-cffi
pkgver=1.15.0
pkgrel=3
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
depends=('python-pycparser')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2")
sha512sums=('c8a0a061905d133770a06d4c4fd0158a104a04a88f1c9367160e8c1e1d2153af903aaa8dcb3cc3e252f02c6d6a8e11240bf5b82c490281d6ce8f8e21d59afa93')

build() {
  cd "$srcdir"/cffi-v$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/cffi-v$pkgver
  python setup.py pytest
}

package() {
  cd cffi-v$pkgver

  # remove files created during check() for reproducible SOURCES.txt
  rm -rf testing/cffi{0,1}/__pycache__/

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
