# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca> 
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=openupsmart
pkgver=1.0
pkgrel=2
pkgdesc="A daemon for Mustek/Centralion UPSs."
arch=('i686' 'x86_64')
url="http://openupsmart.sourceforge.net"
license=('GPL')
depends=('ncurses')
backup=('etc/openupsmart.conf')
source=(http://dl.sourceforge.net/sourceforge/openupsmart/$pkgname-$pkgver.tar.gz \
        openupsmart openupsmart.logrotate)
md5sums=('3fa1050a2141d19b189713effa0619be'
         '5a5af20af079e63fe09153402da36791'
         'be4f43217490803b59045098d99d4501')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 $startdir/openupsmart \
    $startdir/pkg/etc/rc.d/openupsmart
  install -D -m 644 $startdir/openupsmart.logrotate \
    $startdir/pkg/etc/logrotate.d/openupsmart
  sed -i -e "s:no_fork=y:no_fork=N:" \
         -e "s:./openupsmartd.log:/var/log/openupsmartd.log:" \
         $startdir/pkg/etc/openupsmart.conf 
}
