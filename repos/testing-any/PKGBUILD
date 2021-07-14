# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-requests
pkgname=('python-requests' 'python2-requests')
pkgver=2.26.0
pkgrel=1
pkgdesc="Python HTTP for Humans"
arch=('any')
url="http://python-requests.org"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-chardet' 'python2-chardet'
             'python-urllib3' 'python2-urllib3' 'python-idna' 'python2-idna')
checkdepends=('python-pytest-httpbin' 'python-pytest-mock' 'python-pysocks' 'python-trustme')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/psf/requests/archive/v$pkgver.tar.gz"
        certs.patch)
sha512sums=('df7b3fbef42e600434764b2ae3906546a778f8caab0111d818adef7c747d4d58e9977ac9ae25092e1170a2cde78234e64b779ba4afd84bb2bf7dbce6efb380e9'
            '424a3bb01b23409284f6c9cd2bc22d92df31b85cfd96e1d1b16b5d68adeca670dfed4fff7977d8b10980102b0f780eacc465431021fcd661f3a17168a02a39a3')

prepare() {
  cd "$srcdir"/requests-$pkgver
  # Stay with chardet for now: https://github.com/psf/requests/issues/5871
  sed -e '/certifi/d' \
      -e "s/,<.*'/'/" \
      -e '/charset_normalizer/d' \
      -i setup.py
  patch -p1 -i "$srcdir"/certs.patch

  cd "$srcdir"
  cp -a requests-$pkgver{,-py2}
  find requests-$pkgver-py2 -name \*.py -exec sed -r 's|^#!(.*)python$|#!\1python2|' -i {} +
}

build() {
  cd "$srcdir"/requests-$pkgver
  python setup.py build

  cd "$srcdir"/requests-$pkgver-py2
  python2 setup.py build
}

check() {
  # Seems to be a problem about pytest-httpbin:
  # pytest-httpbin server hit an exception serving request: [SSL: HTTP_REQUEST] http request (_ssl.c:1129)
  # pytest-httpbin server hit an exception serving request: [SSL: TLSV1_ALERT_UNKNOWN_CA] tlsv1 alert unknown ca (_ssl.c:1129)

  cd requests-$pkgver
  pytest tests --deselect tests/test_requests.py::TestRequests::test_pyopenssl_redirect
}

package_python-requests() {
  depends=('python-urllib3' 'python-chardet' 'python-idna')
  optdepends=('python-pysocks: SOCKS proxy support')

  cd "$srcdir"/requests-$pkgver
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

package_python2-requests() {
  depends=('python2-urllib3' 'python2-chardet' 'python2-idna')
  optdepends=('python2-ndg-httpsclient: HTTPS requests with SNI support'
              'python2-grequests: asynchronous requests with gevent'
              'python2-pysocks: SOCKS proxy support')

  cd "$srcdir"/requests-$pkgver-py2
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
