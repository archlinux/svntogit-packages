# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-automat
pkgname=('python-automat' 'python2-automat')
pkgver=0.8.0
pkgrel=1
arch=('any')
license=('MIT')
pkgdesc="Self-service finite-state machines for the programmer on the go."
url="https://github.com/glyph/automat"
makedepends=('python-setuptools-scm' 'python2-setuptools-scm' 'm2r' 'python2-m2r' 'python-attrs'
             'python2-attrs')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-pytest-benchmark'
              'python2-pytest-benchmark')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/glyph/automat/archive/v$pkgver.tar.gz")
sha512sums=('44ebd21a1f058e147f87e726fd62d74b399db6e1e22bd5572508a771ea26141b4ded5719ee35fc05c9c0af134a20ad33e303a82447da768e4839c71b96117806')

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
  python setup.py pytest

  cd "$srcdir"/automat-$pkgver-py2
  python2 setup.py pytest
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
