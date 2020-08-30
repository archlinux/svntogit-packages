# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cryptography
pkgname=('python-cryptography' 'python2-cryptography')
pkgver=3.1
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography"
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six' 'python-cffi'
             'python2-cffi' 'python2-enum34' 'python-pyasn1' 'python2-pyasn1' 'python-idna'
             'python2-idna' 'python2-ipaddress' 'python-asn1crypto' 'python2-asn1crypto')
checkdepends=('python-pytest-runner' "python-cryptography-vectors=$pkgver" 'python-iso8601'
              'python-pretend' 'python-hypothesis' 'python-pytz')
source=("https://pypi.io/packages/source/c/cryptography/cryptography-$pkgver.tar.gz")
sha512sums=('c015df3a71e4c274b2fb8fd954d264c8b56443644048139113f548c69cf83798b73c9f0993609f338044df92b609723b0281ce61ed2751309a122de22060037e')

prepare() {
  cp -a cryptography-${pkgver}{,-python2}
}

build() {
  cd "$srcdir"/cryptography-$pkgver
  python setup.py build

  cd "$srcdir"/cryptography-$pkgver-python2
  python2 setup.py build
}

check() {
  cd cryptography-$pkgver
  python setup.py pytest
}

package_python-cryptography() {
  depends=('python-six' 'python-cffi' 'python-idna' 'python-setuptools' 'python-asn1crypto')

  cd cryptography-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-cryptography() {
  depends=('python2-six' 'python2-cffi' 'python2-enum34' 'python2-idna' 'python2-ipaddress'
           'python2-setuptools' 'python2-asn1crypto')

  cd cryptography-$pkgver-python2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
