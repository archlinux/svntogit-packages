# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Surain Mallawa Arachchi <mas@crc32.net>

# kernel 2.6.19 compatibility provided by Jacek Roszkowski <j_roszkowski@hoth.amu.edu.pl> (http://crc32.net/linux-atm/)
pkgname=linux-atm
pkgver=2.4.1
pkgrel=3
pkgdesc="Drivers and tools to support ATM networking under Linux."
arch=('i686' 'x86_64')
depends=('glibc')
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz \
        http://www.linux-usb.org/SpeedTouch/LFS/linux-atm-2.4.1-gcc-4.patch \
	linux-atm-2.4.1-kernel-2.6.19.patch)
url="http://linux-atm.sourceforge.net/"
license=(GPL)
options=(!libtool)
md5sums=('84fef49cc39ff2605204246666f65864'
'2824a6ba2cbd7e9af34cd284fe654947'
'eb61e0a887b935c347955c2d155263fb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i $startdir/src/linux-atm-2.4.1-gcc-4.patch || return 1
  patch -Np1 -i $startdir/src/linux-atm-2.4.1-kernel-2.6.19.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
