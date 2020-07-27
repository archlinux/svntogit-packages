# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgbase=python-cffi
pkgname=(python-cffi python2-cffi)
pkgver=1.14.1
pkgrel=1
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-pycparser' 'python2-pycparser')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2")
sha512sums=('eaba47b7eb12be4e7147d21769435e71f841d6950c099343cef742bbc5a8eb26dbb0bc5f036285611073f4363604f2049166e53d92358f755af8f727669aed2d')

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
