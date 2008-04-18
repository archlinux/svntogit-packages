# $Id$
# Maintainer: damir <damir@archlinux.org>
#Contributor: Kevin Edmonds <edmondskevin@hotmail.com>

pkgname=libmtp
pkgver=0.2.4
pkgrel=1
pkgdesc="library implementation of the Media Transfer Protocol"
arch=("i686" "x86_64")
url="http://libmtp.sourceforge.net"
license=("LGPL")
depends=("libusb")
source=("http://switch.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

md5sums=('078d9734c71b08208fbd8b1800e61b65')
