# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis
#

pkgname=djbdns
pkgver=1.05
pkgrel=1
pkgdesc="High-performant & secure DNS services."
url="http://cr.yp.to/djbdns.html"
depends=('daemontools' 'ucspi-tcp')
install="$pkgname.install"
source=(http://cr.yp.to/$pkgname/$pkgname-$pkgver.tar.gz 1.05-errno.patch)
md5sums=('3147c5cd56832aa3b41955c7a51cbeb2' \
    '188096855028696985f1b9d839d1643f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/patch -p0 < $startdir/1.05-errno.patch
  /bin/echo "gcc ${CFLAGS}" > conf-cc
  /bin/echo "/usr" > conf-home
  /usr/bin/make || return 1

  /bin/install -D -m 644 dnsroots.global $startdir/pkg/etc/dnsroots.global
  for bin in *-conf dnscache tinydns walldns rbldns pickdns axfrdns \
      *-get *-data *-edit dnsip dnsipq dnsname dnstxt dnsmx \
      dnsfilter random-ip dnsqr dnsq dnstrace dnstracesort; do
    /bin/install -D -m 755 $bin $startdir/pkg/usr/bin/$bin
  done
}
# vim: ts=2: ft=sh
