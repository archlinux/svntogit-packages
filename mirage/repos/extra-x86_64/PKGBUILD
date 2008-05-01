# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
pkgname=mirage
pkgver=0.9.3
pkgrel=1
pkgdesc="A simple GTK+ Image Viewer"
url="http://mirageiv.berlios.de"
license=("GPL")
depends=('pygtk')
arch=('i686' 'x86_64')
source=(http://download.berlios.de/mirageiv/mirage-$pkgver.tar.gz)
install=$pkgname.install

build() {
  cd $startdir/src/mirage-$pkgver
  python setup.py install --root=$startdir/pkg
}




md5sums=('3b51ef6aa1a423e2c22079668add0f2b')
