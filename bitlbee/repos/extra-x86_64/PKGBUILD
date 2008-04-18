# $Id$
# Contributor: FUBAR <mrfubar@gmail.com>
# Maintainer: simo <simo@archlinux.org>
pkgname=bitlbee
pkgver=1.0.4
pkgrel=1
pkgdesc="An IRC to IM gateway. Supports MSN, ICQ, Jabber, Yahoo!, and AIM"
arch=(i686 x86_64)
url="http://www.bitlbee.org/" 
license="GPL"
depends=('gnutls>=1.4.0' 'glib2' 'xinetd')
install=bitlbee.install
backup=(etc/bitlbee/bitlbee.conf etc/bitlbee/motd.txt etc/xinetd.d/bitlbee)
source=(http://get.bitlbee.org/src/$pkgname-$pkgver.tar.gz bitlbee.xinetd)
md5sums=('b92e301930e2322a86b73b1f6c857674'
         '81e576369e31377f5217e636b00874b1')

build() { 
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --ssl=gnutls --etcdir=/etc/bitlbee
  make || return 1
  mkdir -p $startdir/pkg/var/lib
  install -o65 -g65 -d -m0770 $startdir/pkg/var/lib/bitlbee
  install -D -m644 $startdir/src/bitlbee.xinetd \
                   $startdir/pkg/etc/xinetd.d/bitlbee
  make DESTDIR=$startdir/pkg install
  make DESTDIR=$startdir/pkg install-etc
}
