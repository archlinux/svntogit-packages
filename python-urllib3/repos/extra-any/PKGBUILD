# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgbase=python-urllib3
pkgname=(python-urllib3 python2-urllib3 python-urllib3-doc)
pkgver=1.26.3
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=("any")
url="https://github.com/urllib3/urllib3"
license=("MIT")
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx' 'python-ndg-httpsclient'
             'python2-ndg-httpsclient' 'python-pyasn1' 'python2-pyasn1' 'python-pyopenssl'
             'python2-pyopenssl' 'python-pysocks' 'python2-pysocks' 'python-mock' 'python2-mock'
             'python-brotli' 'python-sphinx-furo')
checkdepends=('python-pytest-runner' 'python-tornado' 'python-nose' 'python-psutil' 'python-trustme'
              'python-gcp-devrel-py-tools' 'python-flaky' 'python-dateutil')
source=("https://github.com/urllib3/urllib3/archive/$pkgver/$pkgbase-$pkgver.tar.gz"
        urllib3-use-brotli-new.patch::https://github.com/urllib3/urllib3/pull/2099.patch)
sha512sums=('e9abbc98bdd0586b6819d4e87f81cd7b49d1ff1ed845e3c93d60be776d9c9d540de914a52a61787538463727e075a3f1fab536a127ed9ba1f91f76417c075535'
            '16bc19caf4b0d80ccb7aae7ee0cf4a7b6fef754d6d7b9e3bc0da9197afffa4f587f197c7fdffa56c14d40da806633cd409b5d8136ca4d1acef414afaf42d1e0f')

prepare() {
  patch -d urllib3-$pkgver -p1 -i ../urllib3-use-brotli-new.patch || :
  cp -a urllib3-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/urllib3-$pkgver
  python setup.py build

  cd "$srcdir"/urllib3-$pkgver-py2
  python2 setup.py build

  cd "$srcdir"/urllib3-$pkgver/docs
  make html
}

check() {
  cd urllib3-$pkgver
  # TODO: investigate test_respect_retry_after_header_sleep
  python setup.py pytest --addopts "--deselect test/test_retry.py::TestRetry::test_respect_retry_after_header_sleep --deselect test/test_retry_deprecated.py::TestRetry::test_respect_retry_after_header_sleep"
}

package_python-urllib3() {
  depends=('python')
  optdepends=('python-pysocks: SOCKS support'
              'python-brotli: Brotli support'
              'python-pyopenssl: security support')

  cd urllib3-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-urllib3() {
  depends=('python2')
  optdepends=('python2-pysocks: SOCKS support'
              'python2-pyopenssl: security support')

  cd urllib3-$pkgver-py2
  python2 setup.py install --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python-urllib3-doc() {
  pkgdesc="urllib3 Documentation"

  cd urllib3-$pkgver/docs
  install -d "$pkgdir"/usr/share/doc
  cp -r _build/html "$pkgdir"/usr/share/doc/python-urllib3
  install -Dm644 ../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
