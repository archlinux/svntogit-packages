# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: eric <eric@archlinux.org>

pkgname=vtun
pkgver=3.0.2
pkgrel=1
pkgdesc="Create virtual tunnels over TCP/IP networks with traffic shaping"
arch=('i686' 'x86_64')
url="http://vtun.sourceforge.net/"
license=('GPL')
depends=('openssl<=0.9.8g' 'zlib')
makedepends=('bison' 'flex' 'm4')
backup=('etc/vtun/vtund.conf')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('d3d8bc4d58886498a1c338670eab9315')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-lzo --sysconfdir=/etc/vtun \
    --localstatedir=/var
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg STAT_DIR=/var/log install
}
# vim: ts=2 sw=2 et ft=sh
