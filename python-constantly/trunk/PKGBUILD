# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-constantly
pkgname=('python-constantly' 'python2-constantly')
pkgver=15.1.0
pkgrel=3
pkgdesc='Symbolic constants in Python'
arch=('any')
license=('MIT')
url='https://github.com/twisted/constantly'
makedepends=('python-setuptools' 'python2-setuptools' 'git')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-twisted' 'python2-twisted')
source=("git+https://github.com/twisted/constantly.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a constantly{,-py2}
}

build() {
  cd "$srcdir"/constantly
  python setup.py build

  cd "$srcdir"/constantly-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/constantly
  python setup.py ptr

  cd "$srcdir"/constantly-py2
  python2 setup.py ptr
}

package_python-constantly() {
  depends=('python')

  cd constantly
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-constantly() {
  depends=('python2')

  cd constantly-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
