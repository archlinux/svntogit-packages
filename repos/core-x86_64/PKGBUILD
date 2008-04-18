# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
# Contributer: Jason Chu <jchu@xentac.net>
pkgname=wireless_tools
pkgver=29
pkgrel=2
pkgdesc="Wireless Tools"
arch=(i686 x86_64)
url="http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/Tools.html"
license=('GPL')
depends=('glibc')
backup=('etc/conf.d/wireless')
source=(http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz wireless.conf.d)
md5sums=('e06c222e186f7cc013fd272d023710cb'
         '027576534885b8d5dded9be546057b12')

build() {
  cd $startdir/src/wireless_tools.29
  make || return 1
  mkdir -p $startdir/pkg/usr/sbin
  mkdir -p $startdir/pkg/usr/lib
  mkdir -p $startdir/pkg/usr/include
  mkdir -p $startdir/pkg/usr/man/man8
#  make INSTALL_DIR=$startdir/pkg/usr/sbin/ INSTALL_LIB=$startdir/pkg/usr/lib/ INSTALL_INC=$startdir/pkg/usr/include/ INSTALL_MAN=$startdir/pkg/usr/man/ install
  make PREFIX=$startdir/pkg/usr install
  install -D -m644 ../wireless.conf.d $startdir/pkg/etc/conf.d/wireless
}
