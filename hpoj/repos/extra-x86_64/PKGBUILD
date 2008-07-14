# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>


pkgname=hpoj
pkgver=0.91
pkgrel=12
pkgdesc="Hewlett-Packard OfficeJet, PSC, LaserJet, and PhotoSmart printer multi-function peripherals (MFPs) drivers"
arch=('i686' 'x86_64')
url="http://hpoj.sourceforge.net"
makedepends=('qt3')
depends=('perl' 'libusb' 'net-snmp>=5.4' 'hplip>=1.7.2')
source=(http://heanet.dl.sourceforge.net/sourceforge/hpoj/$pkgname-$pkgver.tgz \
	hpoj-gcc4.patch hpoj-kernel26.patch hpoj-pack.patch snmp_api.h net-snmp-header-fix.patch)
install=hpoj.install

build() {
  cd $startdir/src/$pkgname-$pkgver
  # adding various patches
   patch -Np1 -i ../hpoj-gcc4.patch || return 1
   patch -Np1 -i ../hpoj-kernel26.patch || return 1
   patch -Np1 -i ../hpoj-pack.patch  || return 1
  cp $startdir/src/snmp_api.h $startdir/src/$pkgname-$pkgver/lib/ptal/
   cd $startdir/src/$pkgname-$pkgver/lib/ptal
   patch -Np0 -i ../../../net-snmp-header-fix.patch || return 1
  cd $startdir/src/$pkgname-$pkgver/
  ./configure --prefix=/usr
   make || return 1
   make prefix=$startdir/pkg/usr/ user_install
   mkdir -p $startdir/pkg/etc/rc.d
   mkdir -p $startdir/pkg/usr/lib/sane
   mkdir -p $startdir/pkg/usr/lib/cups/backend
   install -m 644 lib/sane/libsane-hpoj.so.1.0 $startdir/pkg/usr/lib/sane
   cd $startdir/pkg/usr/lib/sane  
   ln -s libsane-hpoj.so.1.0 libsane-hpoj.so
   ln -s libsane-hpoj.so.1.0 libsane-hpoj.so.1
   ln -s /usr/sbin/ptal-init $startdir/pkg/etc/rc.d
   ln -s /usr/sbin/ptal-cups $startdir/pkg/usr/lib/cups/backend/ptal
 }

md5sums=('0e083aeab9b00495aa433fa9465456e0'
         '347bb155c5dde443a93d92d8e64579a2'
         '18481d3dcf6e9cadf0a3d196ee164e37'
         '1c3b99f1a2178675d56ece29daba0fd7'
         'a3c23abaee2c5aafcc33b3944dcb1b72'
         'e78f16dc75b95dabc0c845526aa6d87b')
