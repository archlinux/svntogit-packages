# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-cryptography
pkgname=('python-cryptography' 'python2-cryptography')
pkgver=2.5
pkgrel=1
pkgdesc="A package designed to expose cryptographic recipes and primitives to Python developers"
arch=('x86_64')
license=('Apache')
url="http://pypi.python.org/pypi/cryptography"
makedepends=('python-setuptools' 'python2-setuptools' 'python-six' 'python2-six' 'python-cffi'
             'python2-cffi' 'python2-enum34' 'python-pyasn1' 'python2-pyasn1' 'python-idna'
             'python2-idna' 'python2-ipaddress' 'python-asn1crypto' 'python2-asn1crypto')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' "python-cryptography-vectors=$pkgver"
              "python2-cryptography-vectors=$pkgver" 'python-iso8601' 'python2-iso8601'
              'python-pretend' 'python2-pretend' 'python-hypothesis' 'python2-hypothesis'
              'python-pytz' 'python2-pytz')
source=("https://pypi.io/packages/source/c/cryptography/cryptography-$pkgver.tar.gz")
sha512sums=('5e8f8818fcaa8143526006b027107b8afbdc925d40c846701e65b2c7ee02235b7e0918246515520ef2030b1c87bb157d0d403c28ad68c31459d677af7e2d0b3f')

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
  cd "$srcdir"/cryptography-$pkgver
  python setup.py pytest

  cd "$srcdir"/cryptography-$pkgver-python2
  python2 setup.py pytest
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
