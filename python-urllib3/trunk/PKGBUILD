# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgbase=python-urllib3
pkgname=(python-urllib3 python-urllib3-doc)
pkgver=1.26.13
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=("any")
url="https://github.com/urllib3/urllib3"
license=("MIT")
makedepends=('python-setuptools' 'python-sphinx' 'python-ndg-httpsclient'
             'python-pyasn1' 'python-pyopenssl'
             'python-pysocks' 'python-mock'
             'python-brotli' 'python-sphinx-furo')
checkdepends=('python-pytest-runner' 'python-tornado' 'python-nose' 'python-psutil' 'python-trustme'
              'python-gcp-devrel-py-tools' 'python-flaky' 'python-dateutil')
source=("https://github.com/urllib3/urllib3/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('d8b6b7afa6597e934e1deedf98573226a403d83e306c7471195a079086e048a2e30be5c5a3840e39700b276993e6cf9e3a52328acc7d85e5859618392c30f912')

build() {
  cd urllib3-$pkgver
  python setup.py build

  cd docs
  PYTHONPATH="../build/lib" make html
}

check() {
  cd urllib3-$pkgver
  # TODO
  python setup.py pytest --addopts "--deselect test/test_retry.py::TestRetry::test_respect_retry_after_header_sleep \
                                    --deselect test/test_retry_deprecated.py::TestRetry::test_respect_retry_after_header_sleep \
                                    --deselect test/contrib/test_pyopenssl.py::TestSSL::test_ssl_read_timeout \
                                    --deselect test/with_dummyserver/test_socketlevel.py::TestSSL::test_ssl_read_timeout"
}

package_python-urllib3() {
  depends=('python')
  optdepends=('python-pysocks: SOCKS support'
              'python-brotli: Brotli support'
              'python-pyopenssl: security support'
              'python-idna: security support')

  cd urllib3-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-urllib3-doc() {
  pkgdesc="urllib3 Documentation"

  cd urllib3-$pkgver/docs
  install -d "$pkgdir"/usr/share/doc
  cp -r _build/html "$pkgdir"/usr/share/doc/python-urllib3
  install -Dm644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
