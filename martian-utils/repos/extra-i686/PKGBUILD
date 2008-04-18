# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Steve Vialle <steve_v@orcon.net.nz>

pkgname=martian-utils
pkgver=20061203
pkgrel=1
license=("GPL" "custom:Agere Systems license")
arch=('i686')
_kernver=2.6.21-ARCH
pkgdesc="Alternative drivers for the Mars chipset Lucent LT Winmodem (PCI). For beyond 2.6 kernel" 
url="http://martian.barrelsoutofbond.org/"
source=(http://www.barrelsoutofbond.org/downloads/martian/martian-full-${pkgver}.tar.gz martian.rc.d) 
depends=('glibc')
options=('NOSTRIP')
replaces=('ltmodem-utils')

build() { 

#Build
  cd $startdir/src/martian && make KERNEL_DIR=/usr/src/linux-${_kernver} all || return 1 

#install helper app
install -D -m 755 $startdir/src/martian/modem/martian_modem $startdir/pkg/usr/sbin/martian_modem

#Install rc script
install -D -m 755 $startdir/src/martian.rc.d $startdir/pkg/etc/rc.d/martian
}  

md5sums=('599dcd2441ce996bb466853cb95b9ec9'
         '4e735ae1e74b8c2740637ff2308b9a33')
