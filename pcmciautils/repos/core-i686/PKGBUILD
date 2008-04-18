# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=pcmciautils
pkgver=014
pkgrel=4
pkgdesc="Utilities for inserting and removing PCMCIA cards"
arch=(i686 x86_64)
url="http://kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html"
license=('GPL')
groups=('base')
depends=('glibc' 'sysfsutils' 'module-init-tools>=3.2pre9')
conflicts=('pcmcia-cs')
source=(http://kernel.org/pub/linux/utils/kernel/pcmcia/pcmciautils-$pkgver.tar.bz2)
md5sums=('3f07c926875f6c5dcb83240f39725177')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i -e 's,/usr/bin/install,/bin/install,g' Makefile
  make -j1 || return 1
  make DESTDIR=$startdir/pkg/ install
  # fix udev rules for new modalias layout
  sed -i -e 's/MODALIAS/ENV{MODALIAS}/g' -e 's/$modalias/$env{MODALIAS}/g'\
  $startdir/pkg/etc/udev/rules.d/60-pcmcia.rules
  # fix lspcmcia symlink
  ln -sf pccardctl $startdir/pkg/sbin/lspcmcia
  # adding static binaries for initrd setup
  make clean
  sed -i -e 's/STATIC\ =\ false/STATIC\ =\ true/g' Makefile
  make -j1 || return 1
  install -D -m755 pcmcia-check-broken-cis $startdir/pkg/sbin/pcmcia-check-broken-cis.static
  install -D -m755 pcmcia-socket-startup $startdir/pkg/sbin/pcmcia-socket-startup.static
  # fix modprobe rules to use the load-modules.sh
  sed -i -e "s#/sbin/modprobe#/lib/udev/load-modules.sh#g" $startdir/pkg/etc/udev/rules.d/*
}
