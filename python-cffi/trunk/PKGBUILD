# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=python-cffi
pkgver=1.15.1
pkgrel=2
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
depends=('python-pycparser')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2")
sha512sums=('4505c1e3206b66fbdf06ba39be6daac14a35f7148cef3156bb2015792cb59c004ea13fe7c7514feb35ecc5e7526a88fc0b3036ae84fd146a0a3b55bc676e8e51')

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
