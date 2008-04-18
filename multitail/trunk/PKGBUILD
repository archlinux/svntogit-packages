# $Id$
# Mantainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Roberto Carvajal <roberto@archlinux.org>

pkgname=multitail
pkgver=5.2.1
pkgrel=1
pkgdesc="MultiTail lets you view one or multiple files like the original tail program."
arch=(i686 x86_64)
license=('GPL')
url="http://www.vanheusden.com/multitail"
depends=('ncurses')
backup=(etc/multitail.conf)
source=($url/$pkgname-$pkgver.tgz)
md5sums=('6f2c9a821a5b12a0c03d92f8d137df12')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /usr/bin/make || return 1
  /bin/install -D -m 755 multitail $startdir/pkg/usr/bin/multitail
  /bin/install -D -m 644 multitail.1 $startdir/pkg/usr/man/man1/multitail.1
  /bin/install -D -m 644 multitail.conf $startdir/pkg/etc/multitail.conf
}
# vim: ts=2 sw=2 et ft=sh
