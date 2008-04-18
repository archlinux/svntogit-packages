# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: kleptophobiac@gmail.com

pkgname=mythflix
pkgver=0.21
pkgrel=1
pkgdesc="Netflix access plugin for MythTV"
arch=('i686' 'x86_64')
url="http://www.mythtv.org"
license=('GPL')
depends=("mythtv>=${pkgver}")
source=("http://www.mythtv.org/modules.php?name=Downloads&d_op=getit&lid=136&foo=/mythplugins-$pkgver.tar.bz2")
md5sums=('6c08043227bef1384858deee12b5cdc3')
groups=('mythtv-extras')

build() {
   cd $startdir/src/mythplugins-${pkgver}
   . /etc/profile.d/qt3.sh

   # use QT3 qmake
   export PATH=$QTDIR/bin:$PATH
   ./configure --prefix=/usr --disable-all --enable-opengl --enable-mythflix 

   qmake mythplugins.pro
   make qmake || return 1
   make -j 2 || return 1

   make INSTALL_ROOT=$startdir/pkg install
}

