# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=schafkopf
pkgver=0.7
pkgrel=1
pkgdesc="Schafkopf, A bavarian card game aka Sheepshead" 
url="http://schafkopf.berlios.de" 
depends=('kdelibs') 
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2) 
build() { 
  cd $startdir/src/$pkgname-$pkgver 
  ./configure --prefix=/opt/kde --enable-final --disable-debug 
  make || return 1 
  make DESTDIR=$startdir/pkg/ install 
}
md5sums=('7d153105b4bc6700f57b524100e05392')
