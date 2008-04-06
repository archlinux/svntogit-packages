# Maintainer: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=python-elementtree
pkgver=1.2.6
pkgrel=2
pkgdesc="Contains a number of light-weight components for working with XML in python"
arch=('i686' 'x86_64')
url="http://effbot.org/downloads/#elementtree"
license="MIT"
depends=('python')
provides=('elementtree')
replaces=('elementtree')
source=(http://effbot.org/downloads/elementtree-$pkgver-20050316.tar.gz license.txt)
md5sums=('e1b21716be8bfff8bf192fc3880ad008' '534bb114ba6031d78d73dc5c6ecdb527')

build() {
  cd $startdir/src/elementtree-$pkgver-20050316
  python setup.py install --root=$startdir/pkg
  install -Dm644 ../license.txt $startdir/pkg/usr/share/licenses/python-elementtree/license.txt
}
