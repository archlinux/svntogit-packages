# Maintainer : Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@gmail.com>

pkgname=('python-markupsafe' 'python2-markupsafe')
pkgver=1.0
pkgrel=2
pkgdesc="Implements a XML/HTML/XHTML Markup safe string for Python"
arch=('x86_64')
url="http://pypi.python.org/pypi/MarkupSafe"
license=('custom')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/M/MarkupSafe/MarkupSafe-${pkgver}.tar.gz")
sha512sums=('7437a02cb1b9c1d6d6c20b13d394f24a1cd1cb8c743f832d8b1cbb6ab8846f70f54d924dd693423b33c4d592e772983ae38fd4a35961e233457c48bd3584ecb8')

prepare() {
  cp -a MarkupSafe-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/MarkupSafe-$pkgver
  python setup.py build

  cd "$srcdir"/MarkupSafe-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/MarkupSafe-$pkgver
  python setup.py test

  cd "$srcdir"/MarkupSafe-$pkgver-py2
  python2 setup.py test
}

package_python-markupsafe() {
  depends=('python')

  cd MarkupSafe-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python-markupsafe/LICENSE
}

package_python2-markupsafe() {
  depends=('python2')

  cd MarkupSafe-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python2-markupsafe/LICENSE
}
