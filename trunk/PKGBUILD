# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-incremental
pkgname=('python-incremental' 'python2-incremental')
pkgver=17.5.0
pkgrel=2
pkgdesc='A small library that versions your Python projects'
arch=('any')
license=('MIT')
url='https://github.com/hawkowl/incremental'
makedepends=('python-setuptools' 'python2-setuptools' 'python-click' 'python2-click'
             'python-twisted' 'python2-twisted')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/hawkowl/incremental/archive/incremental-$pkgver.tar.gz")
sha512sums=('42490edf99355d6c1da0015273e92549bd72ecb2674dd4ce5d0b4a7d34ae9d425ebd1708a2420f67963b4baef5b2a12b76a23d67abb7d306e6208e08d79175d7')

prepare() {
  cp -a incremental-incremental-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/incremental-incremental-$pkgver
  python setup.py build

  cd "$srcdir"/incremental-incremental-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/incremental-incremental-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py ptr

  cd "$srcdir"/incremental-incremental-$pkgver-py2
  python2 setup.py ptr
}

package_python-incremental() {
  depends=('python-click' 'python-twisted')

  cd incremental-incremental-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-incremental() {
  depends=('python2-click' 'python2-twisted')

  cd incremental-incremental-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
