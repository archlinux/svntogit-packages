# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=sonata
pkgver=1.5
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



md5sums=('8ab9c7a9ccfcb10056e44297cab1074a')
