# $Id$
# Maintainer: Juergen Hoetzel <juergen@archlinux.org> 
# Contributor: kleptophobiac@gmail.com

pkgname=myththemes
pkgver=0.21
pkgrel=1
pkgdesc="Themes for MythTV"
arch=('i686' 'x86_64')
url="http://www.mythtv.org/"
license=('GPL')
depends=("mythtv>=${pkgver}")
source=("http://www.mythtv.org/modules.php?name=Downloads&d_op=getit&lid=137&foo=/${pkgname}-${pkgver}.tar.bz2")
md5sums=('9a569ab5561f348fdbf82cdc46a1df9b')
groups=('mythtv-extras')

build() {
   cd $startdir/src/$pkgname-$pkgver
   . /etc/profile.d/qt3.sh

   # use QT3 qmake
   export PATH=$QTDIR/bin:$PATH
   ./configure --prefix=/usr || return 1

   qmake $pkgname.pro
   make qmake || return 1
   make || return 1

   # basic install
   make INSTALL_ROOT=$startdir/pkg install || return 1
}

