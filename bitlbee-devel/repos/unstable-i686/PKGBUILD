# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=bitlbee-devel
pkgver=1.1dev
pkgrel=1
pkgdesc="An IRC to IM gateway. Supports MSN, ICQ, Jabber, Yahoo!, and AIM"
arch=(i686 x86_64)
url="http://www.bitlbee.org/" 
license="GPL"
depends=('gnutls>=1.4.0' 'glib2')
conflicts=('bitlbee')
install=bitlbee.install
backup=(etc/bitlbee/bitlbee.conf etc/bitlbee/motd.txt etc/xinetd.d/bitlbee)
source=(http://get.bitlbee.org/src/bitlbee-$pkgver.tar.gz bitlbee.xinetd \
        bitlbee.rcd droproot.diff)
md5sums=('55effa509b6c707b03b542e455dcd9ab' '95aa0cc308298fa226b8604c38ec85e4'\
         'fdf7da979d9dba730a1d733a585bb553' '9adaebedc2ae50ae48cbf0633c7731e5')

build() { 
  cd $startdir/src/bitlbee-$pkgver
  
  patch -Np1 < $startdir/src/droproot.diff

  ./configure --prefix=/usr --ssl=gnutls --etcdir=/etc/bitlbee \
              --pidfile=/var/run/bitlbee/bitlbee.pid \
	      --ipcsocket=/var/run/bitlbee/bitlbee.sock --ipv6=0
  make || return 1
  mkdir -p $startdir/pkg/var/lib
  install -o65 -g65 -d -m0770 $startdir/pkg/var/lib/bitlbee
  install -o65 -g65 -d -m0770 $startdir/pkg/var/run/bitlbee
  install -D -m644 $startdir/src/bitlbee.xinetd \
                   $startdir/pkg/etc/xinetd.d/bitlbee
  install -D -m755 $startdir/src/bitlbee.rcd $startdir/pkg/etc/rc.d/bitlbee
  make DESTDIR=$startdir/pkg install
  make DESTDIR=$startdir/pkg install-etc
}
