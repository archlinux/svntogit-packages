# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributer: Allan McRae <allan@archlinux.org>

pkgbase=python-six
pkgname=('python2-six' 'python-six')
pkgver=1.16.0
pkgrel=5
pkgdesc="Python 2 and 3 compatibility utilities"
arch=('any')
url="https://pypi.python.org/pypi/six/"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'tk')
source=("https://pypi.io/packages/source/s/six/six-$pkgver.tar.gz")
sha512sums=('076fe31c8f03b0b52ff44346759c7dc8317da0972403b84dfe5898179f55acdba6c78827e0f8a53ff20afe8b76432c6fe0d655a75c24259d9acbaa4d9e8015c0')

build() {
  cp -a six-$pkgver{,-py2}
}

check() {
  cd "$srcdir"/six-$pkgver
  python -m pytest
}

package_python-six() {
  depends=('python')

  cd six-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-six() {
  depends=('python2')

  cd six-$pkgver-py2
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
