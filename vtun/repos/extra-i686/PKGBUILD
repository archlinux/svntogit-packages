# $Id$
# Maintainer: eric <eric@archlinux.org>

pkgname=vtun
pkgver=3.0.1
pkgrel=1
pkgdesc="Create virtual tunnels over TCP/IP networks with traffic shaping"
arch=('i686' 'x86_64')
url="http://vtun.sourceforge.net/"
license=('GPL')
depends=('openssl<=0.9.8' 'zlib')
makedepends=('bison' 'flex' 'm4')
backup=('etc/vtun/vtund.conf')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('c342ffe77055d4248a38f0b380f28c1b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-lzo --sysconfdir=/etc/vtun \
    --localstatedir=/var
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg STAT_DIR=/var/log install
}
# vim: ts=2 sw=2 et ft=sh
