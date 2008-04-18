# $Id$
# Maintainer: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=xdrawchem
pkgver=1.9.9
pkgrel=4
pkgdesc="A two-dimensional molecule drawing program for Unix operating systems. It can read and write MDL Molfiles, and read ChemDraw text and binary files, to allow sharing between XDrawChem and other chemistry applications, and it can create images in popular formats like PNG and EPS."
arch=('i686' 'x86_64')
url="http://xdrawchem.sourceforge.net/"
license=('GPL' 'LGPL' 'custom:ARTISTIC')
depends=('qt3>=3.3.5' 'libpng' 'openbabel>=2.1.0' 'ghostscript')
source=(http://switch.dl.sourceforge.net/sourceforge/xdrawchem/$pkgname-$pkgver.tar.gz license.html)
md5sums=('6343d031b3ea19a6606831c89b8006b2' '8c2d33b5a049db65888d48d5de3f3523')

build() {
  cd $startdir/src/$pkgname-$pkgver
  . /etc/profile.d/qt3.sh
  ./configure --prefix=/usr --without-openbabel
        # openbabel is a separate pkg in archlinux
  make || return 1
  make prefix=$startdir/pkg/usr install
  install -D -m644 ../license.html $startdir/pkg/usr/share/licenses/$pkgname/license.html
}
