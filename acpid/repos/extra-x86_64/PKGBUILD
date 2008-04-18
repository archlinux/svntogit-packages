# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Manolis Tzanidakis
pkgname=acpid
pkgver=1.0.6
pkgrel=1
pkgdesc="Utilities for using ACPI power management"
arch=(i686 x86_64)
license=('GPL')
url="http://acpid.sourceforge.net"
depends=(glibc)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	acpid
	anything
	handler.sh)
backup=('etc/acpi/handler.sh' 'etc/acpi/events/anything')
md5sums=('5c9b705700df51d232be223b6ab6414d'
         '15903690f1bae4b3b0625b369de65521'
         '2d37b98d6e74bab815604b8b48c6cfd4'
         '7c304427e87e9551b885af223eb39be6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/make || return 1
  /bin/install -d -m0755 $startdir/pkg/usr/bin
  /usr/bin/make INSTPREFIX=$startdir/pkg \
      MAN8DIR=$startdir/pkg/usr/man/man8 install
  /bin/install -D -m0755 ../acpid $startdir/pkg/etc/rc.d/acpid
  /bin/install -d -m0755 $startdir/pkg/etc/acpi/events
  /bin/install -D -m0644 ../anything $startdir/pkg/etc/acpi/events/anything
  /bin/install -D -m0755 ../handler.sh $startdir/pkg/etc/acpi/handler.sh
}
