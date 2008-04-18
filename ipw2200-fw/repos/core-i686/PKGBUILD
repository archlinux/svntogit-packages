# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=ipw2200-fw
pkgver=3.0
pkgrel=2
pkgdesc="Intel Centrino Drivers firmware for IPW2200"
arch=(i686 x86_64)
url="http://ipw2200.sourceforge.net/"
depends=('wireless_tools')
source=(http://bughost.org/firmware/$pkgname-$pkgver.tgz)
install=ipw2200-fw.install
replaces=ipw2200

build() {
  #cd $startdir/src/$pkgname-$pkgver
  #make
  #Install kernel modules
  #for i in *.ko
  #do
  #install -D -m 644 $i  $startdir/pkg/lib/modules/$(uname -r)/kernel/drivers/net/wireless/ipw2200/$i
  #done
 
  cd $startdir/src/ipw2200-fw-3.0
  
  # Install firmware
  for i in *.fw
  do
  install -D -m 644 $i $startdir/pkg/lib/firmware/$i
  done
  # Install firmware license
  install -D -m 644 LICENSE.ipw2200-fw $startdir/pkg/lib/firmware/LICENSE.ipw2200-fw
 }
md5sums=('34a5ed3702006f5470ebfd513e04d9eb')
