# $Id$
# Maintainer : damir <damir@archlinux.org>

pkgname=kmobiletools
pkgver=0.5.0beta3
_origver=0.5.0-beta3
pkgrel=1
pkgdesc="Make you mobile phone communicate with your PC"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.kmobiletools.org"
depends=('qt3>=3.3.8' 'kdepim>=3.5.8')
source=(http://download.berlios.de/kmobiletools/kmobiletools-$_origver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$_origver
   ./configure --prefix=/opt/kde --enable-final --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }


md5sums=('2880ca9b21ba4f70088be64b6ef6a39b')
