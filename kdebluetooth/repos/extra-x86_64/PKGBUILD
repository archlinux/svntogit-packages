# $Id$
# Contributor: Giovanni Scafora <linuxmania@gmail.com>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=kdebluetooth
pkgver=1.0_beta8
pkgrel=2
pkgdesc="A collection of Bluetooth utilities and modules for KDE based on BlueZ"
arch=('i686' 'x86_64')
url="http://bluetooth.kmobiletools.org/"
license=('GPL')
depends=('openobex' 'obexftp' 'dbus-qt3' 'kdelibs' 'bluez-utils')
makedepends=('pkgconfig')
source=(http://mesh.dl.sourceforge.net/sourceforge/kde-bluetooth/${pkgname}-${pkgver}.tar.bz2)
#source=(http://tomstar.ath.cx/load/kdebluetooth/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd $startdir/src/$pkgname-${pkgver}
  ./configure  --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('0b6aebf7d236894fc442d74425b13386')
