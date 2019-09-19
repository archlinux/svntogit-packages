# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgbase=python-urllib3
pkgname=(python-urllib3 python2-urllib3 python-urllib3-doc)
pkgver=1.25.4
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=("any")
url="https://github.com/shazow/urllib3"
license=("MIT")
makedepends=('python-setuptools' 'python2-setuptools' 'python2-sphinx' 'python-ndg-httpsclient'
             'python2-ndg-httpsclient' 'python-pyasn1' 'python2-pyasn1' 'python-pyopenssl'
             'python2-pyopenssl' 'python-pysocks' 'python2-pysocks' 'python-mock' 'python2-mock'
             'python-brotlipy' 'python2-brotlipy')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-tornado' 'python2-tornado'
              'python-nose' 'python2-nose' 'python-psutil' 'python2-psutil'
              'python-gcp-devrel-py-tools' 'python2-gcp-devrel-py-tools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/shazow/urllib3/archive/$pkgver.tar.gz")
sha512sums=('b1b598d98644d293471a92a2e7d096d19ade0dd33b43c1af9a30a713cbfefd5cfc583a4cf240725b5b5d33a1c6ad351811310209befb7460a8b6a07dc226119d')

prepare() {
  sed -i 's/pytest/tool:pytest/' urllib3-$pkgver/setup.cfg
  cp -a urllib3-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/urllib3-$pkgver
  python setup.py build

  cd "$srcdir"/urllib3-$pkgver-py2
  python2 setup.py build

  # Build with Python 2 since autodoc produces errors on Python 3
  cd "$srcdir"/urllib3-$pkgver/docs
  make SPHINXBUILD=sphinx-build2 html
}

check() {
  # Tests do not support Tornado 5

  cd "$srcdir"/urllib3-$pkgver
  python setup.py pytest || warning "Tests failed"

  cd "$srcdir"/urllib3-$pkgver-py2
  python2 setup.py pytest || warning "Tests failed"
}

package_python-urllib3() {
  depends=('python')
  optdepends=('python-pysocks: SOCKS support'
              'python-brotlipy: Brotli support'
              'python-pyopenssl: security support')

  cd urllib3-$pkgver
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

package_python2-urllib3() {
  depends=('python2')
  optdepends=('python2-pysocks: SOCKS support'
              'python2-brotlipy: Brotli support'
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
