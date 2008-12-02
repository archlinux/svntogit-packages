# $Id$
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=etherape
pkgver=0.9.7
pkgrel=3
pkgdesc="A graphical network monitor for various OSI layers and protocols"
arch=(i686 x86_64)
url="http://etherape.sourceforge.net/"
makedepends=('scrollkeeper')
depends=('libgnomeui' 'libpcap>=0.9.8')
source=(http://dl.sourceforge.net/sourceforge/etherape/$pkgname-$pkgver.tar.gz)
md5sums=('7b5783090d92abe79634da4b582c6b48')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/etherape
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
#      sysconfdir=$startdir/pkg/etc/etherape install
}
# vim: ts=2 sw=2 et ft=sh
