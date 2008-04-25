# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=ettercap
pkgver=NG_0.7.3
_origver=NG-0.7.3
pkgrel=8
pkgdesc="A network sniffer/interceptor/logger for ethernet LANs - console"
arch=(i686 x86_64)
url="http://ettercap.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'openssl' 'libpcap>=0.9.8' 'zlib' 'pcre' 'libtool>=2.2')
makedepends=('libnet')
options=(!libtool)
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$_origver.tar.gz)
md5sums=('28fb15cd024162c55249888fe1b97820')

build() {
  cd $startdir/src/$pkgname-$_origver
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --enable-plugins \
      --enable-https --disable-gtk
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  cd plug-ins
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  chmod 755 $startdir/pkg/usr/lib/ettercap/*
  chmod 755 $startdir/pkg/usr/bin/ettercap
}
