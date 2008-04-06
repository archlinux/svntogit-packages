# $Id: PKGBUILD,v 1.6 2008/01/29 10:11:17 james Exp $
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
pkgname=mirage
pkgver=0.9.2
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



md5sums=('eaa9a871d7c626a56482d5b6c8b16adc')
