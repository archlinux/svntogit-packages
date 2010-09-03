# $Id $
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=python-lxml
pkgver=2.2.7
pkgrel=2
pkgdesc="Python binding for the libxml2 and libxslt libraries"
arch=('i686' 'x86_64')
license=('BSD' 'GPL' 'custom')
url="http://codespeak.net/lxml"
depends=('python2' 'libxslt')
optdepends=("beautiful-soup: support for parsing not well formed HTML")
conflicts=('lxml')
replaces=('lxml')
source=("http://codespeak.net/lxml/lxml-${pkgver}.tgz")
md5sums=('c1da56b823fdc00804938d2b788dbfd0')

package() {
  cd ${srcdir}/lxml-$pkgver

  python2 setup.py install --root=${pkgdir}

  install -D -m644 LICENSES.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 doc/licenses/BSD.txt ${pkgdir}/usr/share/licenses/$pkgname/BSD.txt
  install -D -m644 doc/licenses/elementtree.txt ${pkgdir}/usr/share/licenses/$pkgname/elementtree.txt
}
