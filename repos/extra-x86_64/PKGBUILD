# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.14.4
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2")
sha512sums=('590655ac0ad023ecd36eaa1da29b64325bdb65d7eee41c3c6c5e655ddeee64275f5b381d680caa2045435005013acd7d9b275e67df22e231bd8a765c6ea809fa')

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
