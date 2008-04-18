# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=ipw2100-fw
pkgver=1.3
pkgrel=2
pkgdesc="Intel Centrino Drivers firmware for IPW2100"
arch=(i686 x86_64)
url="http://ipw2100.sourceforge.net/"
depends=('wireless_tools')
#source=(ipw2100-fw-1.3.tgz http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz)
source=(http://bughost.org/firmware/$pkgname-$pkgver.tgz)
install=ipw2100-fw.install
replaces=ipw2100

build() {
  #cd $startdir/src/$pkgname-$pkgver
  #make
  #Install kernel modules
  #for i in *.ko
  #do
  #install -D -m 644 $i $startdir/pkg/lib/modules/$(uname -r)/kernel/drivers/net/wireless/ipw2100/$i
  #done
  
  cd $startdir/src
  
  # Install firmware
  for i in *.fw
  do
  install -D -m 644 $i $startdir/pkg/lib/firmware/$i
  done 
  
  # Install firmware license
  install -D -m 644 LICENSE $startdir/pkg/lib/firmware/LICENSE.ipw2100-fw
 }
md5sums=('46aa75bcda1a00efa841f9707bbbd113')
