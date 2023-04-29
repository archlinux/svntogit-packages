# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

_name=urllib3
pkgbase=python-urllib3
pkgname=(python-urllib3 python-urllib3-doc)
pkgver=1.26.15
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=("any")
url="https://github.com/urllib3/urllib3"
license=("MIT")
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-sphinx-furo'
  'python-wheel'
)
checkdepends=(
  'python-brotli'
  'python-certifi'
  'python-cryptography'
  'python-dateutil'
  'python-flaky'
  'python-gcp-devrel-py-tools'
  'python-idna'
  'python-pyopenssl'
  'python-pysocks'
  'python-pytest'
  'python-pytest-freezegun'
  'python-pytest-timeout'
  'python-tornado'
  'python-trustme'
)
source=("https://github.com/urllib3/urllib3/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha512sums=('edd52a05049a047b1bb913de1cc211a6f7b70802e9ddcb639a973fb910bf218210577a5375077b6569ef382c07668ad6057adb67a31475125c2e5517c603131d')

prepare() {
  # remove python-mock requirement
  find $_name-$pkgver -type f -iname "*.py" -exec sed 's/import mock/from unittest import mock/; s/from mock/from unittest.mock/' -i {} +
}

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation

  cd docs
  PYTHONPATH="../build/lib" make html
}

check() {
  local pytest_options=(
    -vv
    # TODO: report upstream
    --deselect test/test_ssltransport.py::SingleTLSLayerTestCase::test_ssl_object_attributes
    --deselect test/contrib/test_pyopenssl.py::TestSSL::test_ssl_read_timeout
    --deselect test/with_dummyserver/test_socketlevel.py::TestSSL::test_ssl_read_timeout
  )
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  cd $_name-$pkgver
  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  export PYTHONPATH="$PWD/test_dir/$site_packages:$PYTHONPATH"
  pytest "${pytest_options[@]}"
}

package_python-urllib3() {
  depends=('python')
  optdepends=(
    'python-brotli: Brotli support'
    'python-certifi: security support'
    'python-cryptography: security support'
    'python-idna: security support'
    'python-pyopenssl: security support'
    'python-pysocks: SOCKS support'
  )

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}

package_python-urllib3-doc() {
  pkgdesc="urllib3 Documentation"

  cd $_name-$pkgver/docs
  install -d "$pkgdir"/usr/share/doc
  cp -r _build/html "$pkgdir"/usr/share/doc/python-urllib3
  install -Dm644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
