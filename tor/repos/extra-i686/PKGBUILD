# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=tor
pkgver=0.1.2.19
pkgrel=1
pkgdesc="TOR Client"
arch=(i686 x86_64)
url="http://tor.eff.org"
license=('GPL')
install=tor.install
depends=('openssl>=0.9.8g' 'zlib' 'libevent>=1.3e' 'tsocks')
source=(http://tor.eff.org/dist/tor-${pkgver}.tar.gz
				tor.conf
				tor.rc)
md5sums=('4b3f9963b843010af5aa3bd6266d11e0'
         '56c75d4e8a66f34167d31e38c43793dd'
		 		 '4e39d56f462fc9f59e91715ac1b994c0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1

	mkdir -p $startdir/pkg/var/lib
	install -o43 -g43 -d -m0700 $startdir/pkg/var/lib/tor
	install -D -m644 $startdir/src/tor.conf $startdir/pkg/etc/tor/torrc
	install -D -m755 $startdir/src/tor.rc $startdir/pkg/etc/rc.d/tor
	
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/etc/tor/torrc.sample $startdir/pkg/etc/tor/torrc-dist
}
# vim: ft=sh sw=2 ts=2
