# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-requests
pkgver=2.27.1
pkgrel=1
pkgdesc="Python HTTP for Humans"
arch=('any')
url="http://python-requests.org"
license=('Apache')
depends=('python-urllib3' 'python-chardet' 'python-idna')
makedepends=('python-setuptools' 'python-chardet' 'python-urllib3' 'python-idna')
checkdepends=('python-pytest-httpbin' 'python-pytest-mock' 'python-pysocks' 'python-trustme')
optdepends=('python-pysocks: SOCKS proxy support')
source=("https://github.com/psf/requests/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        certs.patch)
sha512sums=('191f8e0d566d541ab4e0c17bc9a637eb79e841605f6bbb9a0e559bd7bf0f00a71be99e21fa5b5431b9d49cb4a64debd0d7083658f98b723cf976833bb685cb9a'
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
  python setup.py build
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
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
