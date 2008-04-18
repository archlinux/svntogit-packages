# $Id$
# Maintainer: Tom K <tom@archlinux.org>

pkgname=linuxdcpp
pkgver=1.0.1
pkgrel=1
pkgdesc="A port of the DC++ direct connect client to Unix/Linux using GTK+"
url="http://linuxdcpp.berlios.de"
license=('GPL')
arch=('i686' 'x86_64')
depends=('libglade' 'bzip2' 'gcc-libs' 'glib' 'zlib' 'openssl')
makedepends=('scons' 'pkgconfig')
conflicts=('linuxdcpp-cvs')
source=(http://download.berlios.de/linuxdcpp/linuxdcpp-$pkgver.tar.bz2
	linuxdcpp.desktop)

build() {
  cd $startdir/src/linuxdcpp-$pkgver

  scons PREFIX=/usr LIBDIR=/usr/share || return 1
  scons install FAKE_ROOT=$startdir/pkg || return 1
  
  install -D ../linuxdcpp.desktop $startdir/pkg/usr/share/applications/linuxdcpp.desktop
  install -D pixmaps/linuxdcpp-icon.png $startdir/pkg/usr/share/pixmaps/linuxdcpp.png
}
md5sums=('5ead00a1c4d07958c784b2f365b7c395'
         'bb9571a39b1b6df474106a19a82ce279')
