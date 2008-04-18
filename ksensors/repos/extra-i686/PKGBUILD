# $Id$
# Contributor: Torsten Evers <tevers@onlinehome.de>
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=ksensors
pkgver=0.7.3
pkgrel=3
pkgdesc="ksensors is nice lm_sensors frontend for KDE"
arch=('i686' 'x86_64')
url="http://ksensors.sourceforge.net/"
license="GPL"
depends=("lm_sensors>=3.0.0" 'kdelibs')
source=(#http://mesh.dl.sourceforge.net/sourceforge/ksensors/$pkgname-$pkgver.tar.gz \
	http://people.atrpms.net/~hdegoede/ksensors-0.7.3-fedora-14.tar.gz)
md5sums=('7c64a2ef836c13d72b5711791819072e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
