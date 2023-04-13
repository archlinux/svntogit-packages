# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: lilydjwg <lilydjwg@gmail.com>

pkgname=python-cffi
pkgver=1.15.1
pkgrel=3
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
depends=('python-pycparser')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2"
        $pkgname-remove-py-usage.patch
        $pkgname-remove-py-test-usage.patch::https://foss.heptapod.net/pypy/cffi/-/merge_requests/115.patch
        $pkgname-python-3.11.patch::https://foss.heptapod.net/pypy/cffi/-/commit/8a3c2c816d789639b49d3ae867213393ed7abdff.patch)
sha512sums=('4505c1e3206b66fbdf06ba39be6daac14a35f7148cef3156bb2015792cb59c004ea13fe7c7514feb35ecc5e7526a88fc0b3036ae84fd146a0a3b55bc676e8e51'
            '3b3c0b34719704cb593919ed50af1eaee29db45b1e3c942c3ca4e0ceebfd263c0bb9ca3703fae19929ed5622ecb78969d89d2d6e32719c5b67f20e7b55548116'
            'bb5707330a30f9f66ab9bf642b8cc74adee61e3b0f4b5dababde8cc1d5637e946e327e9358dbb83ecad49db4a1457ea76d79b6465708464d3e8571993553410d'
            'c4b675c96f931fb9177701830c41da9354f2e2875d31723a759aa35c4e975003ade23ed72dab18065a3437db660863b2ce4f91c15a24e983cd927426a1fc4199')

prepare() {
  cd cffi-v$pkgver
  patch -p1 -i ../$pkgname-remove-py-test-usage.patch
  patch -p1 -i ../$pkgname-remove-py-usage.patch
  patch -p1 -i ../$pkgname-python-3.11.patch
}

build() {
  cd cffi-v$pkgver
  python setup.py build
}

check() {
  cd cffi-v$pkgver
  python setup.py pytest
}

package() {
  cd cffi-v$pkgver

  # remove files created during check() for reproducible SOURCES.txt
  rm -rf testing/cffi{0,1}/__pycache__/

  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
