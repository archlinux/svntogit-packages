# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-requests
pkgver=2.28.2
pkgrel=4
pkgdesc="Python HTTP for Humans"
arch=('any')
url="https://requests.readthedocs.io/"
license=('Apache')
depends=('python-urllib3' 'python-chardet' 'python-idna')
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-chardet
  python-urllib3
  python-idna
)
checkdepends=('python-pytest-httpbin' 'python-pytest-mock' 'python-pysocks' 'python-trustme')
optdepends=('python-pysocks: SOCKS proxy support')
source=("https://github.com/psf/requests/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        certs.patch)
sha512sums=('88c5a92ea51cd18e7edd49a6259d7b56bc0c17f86067f796b5f668ed35202b8bc1395e4811ee2089350e08893dcd304c9801dbf087abfaff1d14859e31bce8ac'
            '424a3bb01b23409284f6c9cd2bc22d92df31b85cfd96e1d1b16b5d68adeca670dfed4fff7977d8b10980102b0f780eacc465431021fcd661f3a17168a02a39a3')

prepare() {
  cd requests-$pkgver
  # Stay with chardet for now: https://github.com/psf/requests/issues/5871
  sed -e '/certifi/d' \
      -e "s/,<.*'/'/" \
      -e '/charset_normalizer/d' \
      -i setup.py
  patch -p1 -i "$srcdir"/certs.patch
}

build() {
  cd requests-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  # Seems to be a problem about pytest-httpbin:
  # pytest-httpbin server hit an exception serving request: [SSL: HTTP_REQUEST] http request (_ssl.c:1129)
  # pytest-httpbin server hit an exception serving request: [SSL: TLSV1_ALERT_UNKNOWN_CA] tlsv1 alert unknown ca (_ssl.c:1129)

  cd requests-$pkgver
  pytest tests --deselect tests/test_requests.py::TestRequests::test_pyopenssl_redirect
}

package() {
  cd requests-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: ts=2 sw=2 et:
