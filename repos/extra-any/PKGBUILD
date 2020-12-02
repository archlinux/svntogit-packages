# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-automat
pkgname=('python-automat' 'python2-automat')
pkgver=20.2.0
pkgrel=4
arch=('any')
license=('MIT')
pkgdesc="Self-service finite-state machines for the programmer on the go."
url="https://github.com/glyph/automat"
makedepends=('python-setuptools-scm' 'python2-setuptools-scm' 'm2r' 'python2-m2r' 'python-attrs'
             'python2-attrs')
checkdepends=('python-pytest' 'python2-pytest' 'python-twisted' 'python2-twisted' 'python-graphviz')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/glyph/automat/archive/v$pkgver.tar.gz")
sha512sums=('ccba3e82f589fedb1f83dfb37a6a42b51a78d8c3e6fea22c9518135ff194f5f70e2f9c5f0eab50b6e116dae92c94754aac8dbf0e670a59015c916991736b4076')

prepare() {
  cp -a automat-$pkgver{,-py2}

  # Set version for setuptools_scm
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
}

build() {
  cd "$srcdir"/automat-$pkgver
  python setup.py build

  cd "$srcdir"/automat-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/automat-$pkgver
  python -m pytest --deselect benchmark

  cd "$srcdir"/automat-$pkgver-py2
  python2 -m pytest --deselect benchmark
}

package_python-automat() {
  depends=('python-attrs' 'python-setuptools')

  cd automat-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python-automat/LICENSE
}

package_python2-automat() {
  depends=('python2-attrs' 'python2-setuptools')

  cd automat-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python2-automat/LICENSE

  mv "$pkgdir"/usr/bin/automat-visualize{,2}
}
