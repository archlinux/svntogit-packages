# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=dhcpcd
pkgver=3.2.1
pkgrel=1
pkgdesc="A DHCP client daemon"
arch=(i686 x86_64)
license=('BSD')
url="http://roy.marples.name/dhcpcd"
groups=('base')
depends=('glibc')
backup=('etc/conf.d/dhcpcd')
source=(http://roy.marples.name/dhcpcd/$pkgname-$pkgver.tar.bz2
	dhcpcd.conf.d)
md5sums=('5a437882b6b9eb29bde323dc411be4a4'
         '12d866a78d9f5fa5f31ca18b3940d847')

build() {
  cd $startdir/src/$pkgname-$pkgver
  #disable DUID usage
  echo "#undef ENABLE_DUID" >> config.h
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/usr/sbin
  ln -sf /sbin/dhcpcd $startdir/pkg/usr/sbin/dhcpcd
  install -D -m644 ../dhcpcd.conf.d $startdir/pkg/etc/conf.d/dhcpcd
}
