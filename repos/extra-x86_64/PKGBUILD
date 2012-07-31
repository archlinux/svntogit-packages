# $Id$
# Maintainer:

pkgname=('python-lxml' 'python2-lxml')
pkgver=2.3.5
pkgrel=1
pkgdesc="Python binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://lxml.de/"
makedepends=('python2' 'python' 'libxslt')
source=(http://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz{,.asc})
sha1sums=('4fec0ca5054a8d6220d3dc7230a5066850192848'
          'd74ad6509a0048ea0e979985e12869f2e1126b78')

check() {
  cd "${srcdir}"/lxml-$pkgver
  make PYTHON=python2 test
  make PYTHON=python test
}

package_python2-lxml() {
  depends=('python2' 'libxslt')
  optdepends=('python2-beautifulsoup3: support for parsing not well formed HTML')

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
