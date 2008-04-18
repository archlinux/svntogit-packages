# $Id$
# Contributor: Sasha Zbrozek <kleptophobiac@gmail.com>
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=ivtv-utils
pkgver=1.0.2
pkgrel=1
_kernver=2.6.22-ARCH
pkgdesc="Non-mainline kernel drivers and userspace utilities for Hauppauge PVR cards"
arch=(i686 x86_64)
license=('GPL')
url="http://ivtvdriver.org"
source=("http://dl.ivtvdriver.org/ivtv/archive/1.0.x/ivtv-$pkgver.tar.gz" \
	'http://dl.ivtvdriver.org/ivtv/firmware/firmware.tar.gz' )
depends=(gcc 'udev>=070')
md5sums=('b3f6ffc71c43da5a7a57c6d33b49af5c' '9e06ccf5afec2a90aab14e8ec905a458')

build() {
  # SET UP
  cd $startdir/src/ivtv-$pkgver || return 1

  # don't call depmod here
  sed -i 's|/sbin/depmod -a||' driver/Makefile i2c-drivers/Makefile || return 1

  # install the utils in /usr/bin, not /usr/local/bin
  sed -i "s%PREFIX = /usr/local%PREFIX = /usr%g" utils/Makefile || return 1

  # build
  make INSTALLDIR=/usr/bin || return 1

  # install
  make DESTDIR=$startdir/pkg install || return 1

  # tweak the install script for the right kernel version
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
  	$startdir/$pkgname.install || return 1

  # install the firmware
  cd $startdir/src || return 1
  for file in  v4l-cx2341x-dec.fw v4l-cx2341x-enc.fw v4l-cx2341x-init.mpg v4l-cx25840.fw v4l-pvrusb2-24xxx-01.fw v4l-pvrusb2-29xxx-01.fw
  do
	  install -D -m 0644 $file $startdir/pkg/lib/firmware/$file || return 1
  done
}
