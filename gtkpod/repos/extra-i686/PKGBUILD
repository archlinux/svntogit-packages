# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=gtkpod
pkgver=0.99.12
pkgrel=1
pkgdesc="a platform independent GUI for Apple's iPod using GTK2"
arch=(i686 x86_64)
license=('GPL')
url="http://gtkpod.sourceforge.net"
install=gtkpod.install
depends=('libgpod>=0.6.0' libmp4v2 flac libid3tag gnome-vfs
        libgnomecanvas flac libvorbis curl)
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('13162a7e9912028922aafcf81d908394')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
