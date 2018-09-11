# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-wstools
pkgname=('python-wstools' 'python2-wstools')
pkgver=0.4.8
pkgrel=2
pkgdesc="WSDL parsing services package for Web Services for Python"
arch=('any')
url="https://github.com/pycontribs/wstools"
license=('custom')
makedepends=('python-pbr' 'python2-pbr' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'autopep8' 'python2-autopep8'
              'python-hacking' 'python2-hacking' 'python-pytest-cov' 'python2-pytest-cov')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/pycontribs/wstools/archive/$pkgver.tar.gz")
sha512sums=('0dc25d28ffbaf2051d8cdabd6b7e0b91d3946a4717a3acf6d36e68b8007d002d01129fb892c2f8ad0eb4c39411b8ff77ab043e1788ad1542d017997ce1826352')

prepare() {
  cp -a wstools-$pkgver{,-py2}
  sed -e 's|#! /usr/bin/env python$|#!/usr/bin/env python2|' \
      -e 's|#!/usr/bin/env python$|#!/usr/bin/env python2|' \
      -i wstools-$pkgver-py2/wstools/{c14n.py,Namespaces.py,XMLSchema.py,Utility.py,__init__.py}

  export PBR_VERSION=$pkgver
}

build() {
  cd "$srcdir"/wstools-$pkgver
  python setup.py build

  cd "$srcdir"/wstools-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/wstools-$pkgver
  python setup.py test

  cd "$srcdir"/wstools-$pkgver-py2
  python2 setup.py test
}

package_python-wstools() {
  depends=('python-six' 'python-setuptools')

  cd wstools-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 docs/* "$pkgdir/usr/share/licenses/$pkgname"/
}

package_python2-wstools() {
  depends=('python2-six' 'python2-setuptools')

  cd wstools-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 docs/* "$pkgdir/usr/share/licenses/$pkgname"/
}
