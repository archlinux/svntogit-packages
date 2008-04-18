# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>
pkgname=lm_sensors
pkgver=3.0.1
pkgrel=1
pkgdesc="Collection of user space tools for general SMBus access and hardware monitoring."
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl' 'sysfsutils')
makedepends=('bison' 'flex')
backup=(etc/sensors3.conf)
install=sensors.install
source=(http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-$pkgver.tar.bz2
	sensors.rc
	fancontrol.rc)
url="http://www.lm-sensors.org/"
md5sums=('dace0c6bb031bd097a46a336de60587c'
         '1dec48b55f4ce3894f4c84bc9b4083e6'
         'f14e335a8eea27388892c36af8099782')

build() {
  cd $startdir/src/$pkgname-$pkgver

  make PREFIX=/usr user || return 1
  make user_install PREFIX=/usr DESTDIR=$startdir/pkg

  install -DT -m755 ../sensors.rc $startdir/pkg/etc/rc.d/sensors
  install -DT -m755 ../fancontrol.rc $startdir/pkg/etc/rc.d/fancontrol

  # FIXME: avoid conflicts with glibc headers
  rm -rf $startdir/pkg/usr/include/linux
}
