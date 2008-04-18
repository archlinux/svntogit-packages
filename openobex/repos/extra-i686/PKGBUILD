# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=openobex
pkgver=1.3
pkgrel=2
pkgdesc="Implementation of the Object Exchange (OBEX) protocol; OBEX is a session protocol and can best be described as a binary HTTP protocol. "
arch=(i686 x86_64)
url="http://openobex.triq.net/"
depends=('glibc' 'bash' 'libusb' 'bluez-libs')

source=(http://umn.dl.sourceforge.net/sourceforge/openobex/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --enable-apps \
  	      --enable-irda \
      	      --enable-bluetooth \
	      --enable-usb \
	      --prefix=/usr
  
  [ "$CARCH" = "x86_64" ] && export CFLAGS="$CFLAGS -fPIC"

  make || return 1
  make DESTDIR=$startdir/pkg/ install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
