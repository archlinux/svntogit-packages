# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: BorgHunter <borghunter at gmail dot com>

pkgbase=python-urllib3
pkgname=(python-urllib3 python2-urllib3 python-urllib3-doc)
pkgver=1.25.10
pkgrel=4
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=("any")
url="https://github.com/shazow/urllib3"
license=("MIT")
makedepends=('python-setuptools' 'python2-setuptools' 'python-sphinx' 'python-ndg-httpsclient'
             'python2-ndg-httpsclient' 'python-pyasn1' 'python2-pyasn1' 'python-pyopenssl'
             'python2-pyopenssl' 'python-pysocks' 'python2-pysocks' 'python-mock' 'python2-mock'
             'python-brotli')
checkdepends=('python-pytest-runner' 'python-tornado' 'python-nose' 'python-psutil' 'python-trustme'
              'python-gcp-devrel-py-tools' 'python-pytest-timeout' 'python-flaky')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/shazow/urllib3/archive/$pkgver.tar.gz"
        urllib3-use-brotli.patch::https://github.com/urllib3/urllib3/pull/1620.patch)
sha512sums=('7927e58de8ef24474179297e6ef7700bb3026a13d578e5bb01e32c6c4b6b5e70cc35980a815e3bcd976678e344250222d38fb86abe0f956e5023deb0f80bc1a1'
            '86f1dc1c8391a8dc9e9de5ff5243abe10579e363083b496aa3740def20e90969fcb470cbc50c1e0062317b235a697dba5f474d0fe635f94497aeac9abd07a414')

prepare() {
  patch -d urllib3-$pkgver -p1 -i ../urllib3-use-brotli.patch
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
  python setup.py pytest
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
