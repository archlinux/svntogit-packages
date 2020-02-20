# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgbase=python-requests
pkgname=('python-requests' 'python2-requests')
pkgver=2.23.0
pkgrel=1
pkgdesc="Python HTTP for Humans"
arch=('any')
url="http://python-requests.org"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-chardet' 'python2-chardet'
             'python-urllib3' 'python2-urllib3' 'python-idna' 'python2-idna')
checkdepends=('python-pytest-httpbin' 'python-pytest-mock' 'python-pysocks' 'python-pyopenssl')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/psf/requests/archive/v$pkgver.tar.gz"
        certs.patch
        "requests-pytest-5.patch::https://github.com/psf/requests/pull/5305.patch")
sha512sums=('a8e670d928fce3531629a6d73ee6b47882f3eba47684841bfce44376781b2b9c5c97186e1750ee582b0c11fa67c983f340f95eb2a4f19042f4cbc77ae090a69c'
            '424a3bb01b23409284f6c9cd2bc22d92df31b85cfd96e1d1b16b5d68adeca670dfed4fff7977d8b10980102b0f780eacc465431021fcd661f3a17168a02a39a3'
            '560aa7d31b51ca2b59cf93cf41c2dcaa648950119653f09ebcd9be2475f5719bf6116c7043d6eb5b317da37bc9893774d46fbc22a14623314f3fd30bc8f62092')

prepare() {
  cd "$srcdir"/requests-$pkgver
  patch -p1 -i ../requests-pytest-5.patch
  sed -e '/certifi/d' \
      -e "s/,<.*'/'/" \
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
  # Seems to be a problem about pytest-httpbin

  cd requests-$pkgver
  pytest tests --deselect tests/test_requests.py::TestRequests::test_https_warnings
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
