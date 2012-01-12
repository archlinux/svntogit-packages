# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=python-lxml
pkgver=2.3.3
pkgrel=1
pkgdesc="Python binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://lxml.de/"
depends=('python2' 'libxslt')
optdepends=('python-beautifulsoup: support for parsing not well formed HTML')
conflicts=('lxml')
replaces=('lxml')
source=(http://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz{,.asc})
md5sums=('a7825793c69d004f388ec6600bad7a6f'
         '5c4b1a05f6e46a4dd7ebed8b5ad9e32e')

check() {
  cd "${srcdir}"/lxml-$pkgver
  make PYTHON=python2 test
}

package() {
  cd "${srcdir}"/lxml-$pkgver

  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSES.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/elementtree.txt
}
