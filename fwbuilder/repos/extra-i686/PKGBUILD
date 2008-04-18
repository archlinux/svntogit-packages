# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=fwbuilder
pkgver=2.1.17
pkgrel=1
pkgdesc="Object-oriented GUI and set of compilers for various firewall platforms"
arch=(i686 x86_64)
license=('GPL')
depends=("libfwbuilder>=$pkgver" 'gcc-libs' 'qt3>=3.3.5')
source=(http://dl.sourceforge.net/sourceforge/fwbuilder/$pkgname-$pkgver.tar.gz)
url="http://www.fwbuilder.org/"
md5sums=('6ac3e9c5663382271287df71e7a30239')

build() {
  cd $startdir/src/$pkgname-$pkgver
. /etc/profile.d/qt3.sh
  [ "$CARCH" = "x86_64" ] && ARCH="-64"
  export QMAKESPEC=/opt/qt/mkspecs/linux-g++$ARCH/
  ./configure --prefix=/usr
  # fix the lib paths
  [ "$CARCH" = "x86_64" ] &&  sed -i "s#lib64#lib#g" \
	{src/fwbedit/Makefile,src/fwblookup/Makefile,src/gui/Makefile,src/ipt/Makefile,src/pf/Makefile,src/ipf/Makefile,src/ipfw/Makefile}
  #sed -i "s#/usr/bin/install#/bin/install#" po/Makefile
  sed -i 's# $(DDIR)# $(INSTALL_ROOT)$(DDIR)#' po/Makefile
  make || return 1
  #make prefix=$startdir/pkg/usr install
  make INSTALL_ROOT=$startdir/pkg install
}
