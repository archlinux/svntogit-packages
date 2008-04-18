# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=adzapper
pkgver=20071120
pkgrel=1
pkgdesc="Ad Zapping With Squid"
arch=('i686' 'x86_64')
url="http://adzapper.sourceforge.net"
license=('BSD')
depends=('squid' 'perl')
install=$pkgname.install
source=($url/adzap-$pkgver.tar.gz adzapper.wrapper adzapper.conf bsd-license)

build() {
  cd $startdir/src/adzap
  /bin/install -D -m 755 scripts/squid_redirect \
      $startdir/pkg/usr/bin/adzapper
  /bin/install -D -m 755 $startdir/src/adzapper.wrapper \
      $startdir/pkg/usr/bin/adzapper.wrapper
  /bin/install -D -m 644 $startdir/src/adzapper.conf \
      $startdir/pkg/etc/adzapper/adzapper.conf
  /bin/install -D -m 644 $startdir/src/bsd-license \
      $startdir/pkg/usr/share/licenses/$pkgname/bsd-license
}

md5sums=('32eb82f36f36079b793d9ee8593178f3'
         '52663be9becbaebb8af1f70fd0084de8'
         '8f8b7ae87a99f266b43f0bea5db68e1b'
         'd69b948083a0b60b2a29b8c78842fb56')
