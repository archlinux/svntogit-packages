# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=('python-lxml' 'python2-lxml')
pkgver=2.3.3
pkgrel=2
pkgdesc="Python binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://lxml.de/"
makedepends=('python2' 'python' 'libxslt')
source=(http://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz{,.asc})
md5sums=('a7825793c69d004f388ec6600bad7a6f'
         '5c4b1a05f6e46a4dd7ebed8b5ad9e32e')

check() {
  cd "${srcdir}"/lxml-$pkgver
  make PYTHON=python2 test
  make PYTHON=python test
}

package_python2-lxml() {
  depends=('python2' 'libxslt')
  optdepends=('python-beautifulsoup: support for parsing not well formed HTML')

  cd "${srcdir}"/lxml-$pkgver
  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSES.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/elementtree.txt
}

package_python-lxml() {
  depends=('python' 'libxslt')

  cd "${srcdir}"/lxml-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSES.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/elementtree.txt
}
