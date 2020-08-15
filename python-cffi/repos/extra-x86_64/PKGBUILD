# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.14.2
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2")
sha512sums=('54e3d3bc708e0f0a9341d05995f5188349577be90bf83f2f52f11d836c89c38608398219ef5562cecbb159cf58d79aff0782f51eff2a7ab8e9c8e8037291c7d8')

prepare() {
  cp -a cffi-v$pkgver{,-py2}
}

build() {
  cd "$srcdir"/cffi-v$pkgver
  python setup.py build

  cd "$srcdir"/cffi-v$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/cffi-v$pkgver
  python setup.py pytest

  cd "$srcdir"/cffi-v$pkgver-py2
  python2 setup.py pytest
}

package_python-cffi() {
  depends=('python-pycparser')

  cd cffi-v$pkgver

  # remove files created during check() for reproducible SOURCES.txt
  rm -rf testing/cffi{0,1}/__pycache__/

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-cffi() {
  depends=('python2-pycparser')

  cd cffi-v$pkgver-py2

  # remove files created during check() for reproducible SOURCES.txt
  rm -rf testing/cffi{0,1}/__pycache__/

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
