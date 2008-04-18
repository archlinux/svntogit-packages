# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=dhcdbd
pkgver=3.0
pkgrel=1
pkgdesc="DHCP D-BUS daemon (dhcdbd) controls dhclient sessions with D-BUS, stores and presents DHCP options"
arch=(i686 x86_64)
license=('GPL')
url="http://people.redhat.com/dcantrel/"
depends=('dbus>=1.0.2-3' 'dhclient')
source=(http://dcantrel.fedorapeople.org/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        dhcdbd.script)
md5sums=('5316b1a0b3a3d53e972374627546d0bf'
         'db539f81ca440d7bc5ea69c83da91c8e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  # Make compatible with dbus 1.0
  sed -i -e 's/dbus_watch_get_unix_fd/dbus_watch_get_fd/g' src/dbus_service.c || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/etc/rc.d/
  install -m755 ${startdir}/src/dhcdbd.script ${startdir}/pkg/etc/rc.d/dhcdbd
}
