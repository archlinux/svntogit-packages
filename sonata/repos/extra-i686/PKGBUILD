# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=sonata
pkgver=1.4.2
pkgrel=1
pkgdesc="A lightweight GTK+ music client for MPD"
url="http://sonata.berlios.de"
license=('GPL3')
arch=(i686 x86_64)
depends=('pygtk')
source=(http://download.berlios.de/sonata/sonata-$pkgver.tar.bz2)
install=$pkgname.install


build() {
  cd $startdir/src/sonata-$pkgver
  python setup.py install --root=$startdir/pkg
}


md5sums=('a1c9b6539b5c9225baf1bbcb58bb942d')
