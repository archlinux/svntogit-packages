# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=glade
pkgver=3.4.3
pkgrel=1
pkgdesc="user interface builder for GTK+ and GNOME."
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('libgnomeui>=2.20.1.1' 'popt')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.0')
options=('!libtool')
url="http://glade.gnome.org/"
install=glade.install
source=(http://ftp.gnome.org/pub/GNOME/sources/glade3/3.4/glade3-$pkgver.tar.bz2)
md5sums=('4cfa58db27431f976d488bf8f0f638cd')

build() {
  cd $startdir/src/glade3-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --with-gtk2
  make || return 1
  make DESTDIR=$startdir/pkg install
}
