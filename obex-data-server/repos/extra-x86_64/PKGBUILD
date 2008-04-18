# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Keerthi <keerthi.linux@gmail.com>

pkgname=obex-data-server
pkgver=0.3
pkgrel=3
pkgdesc="obex-data-server is D-Bus service providing high-level OBEX client and server side functionality."
arch=('i686' 'x86_64')
url="http://wiki.muiline.com/obex-data-server"
license=('GPL')
depends=('glib2' 'dbus' 'dbus-glib' 'libusb' 'bluez-libs' 'openobex')
makedepends=()
source=(http://tadas.dailyda.com/software/$pkgname-$pkgver.tar.gz)
md5sums=('d665127eb9d43d87b98cfff07b8fac60')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-system-config --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
