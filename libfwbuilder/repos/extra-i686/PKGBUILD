# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libfwbuilder
pkgver=2.1.17
pkgrel=1
pkgdesc="Support libraries for fwbuilder"
arch=(i686 x86_64)
license=('GPL')
url="http://www.fwbuilder.org/"
source=(http://dl.sourceforge.net/sourceforge/fwbuilder/$pkgname-$pkgver.tar.gz)
depends=('gcc-libs' 'libxslt' 'net-snmp>=5.4' 'openssl<=0.9.8')
makedepends=('qt3')
md5sums=('94b4a0e8ff8da642726c8b103362956e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  [ "$CARCH" = "x86_64" ] && ARCH="-64"
  . /etc/profile.d/qt3.sh
  export QMAKESPEC=/opt/qt/mkspecs/linux-g++$ARCH/
  ./configure --prefix=/usr
  #sed -i "s#/usr/bin/install#/bin/install#" src/confscript/Makefile
  make || return 1
  make INSTALL_ROOT=$startdir/pkg install
}
