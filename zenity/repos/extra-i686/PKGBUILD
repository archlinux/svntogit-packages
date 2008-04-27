# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=zenity
pkgver=2.22.1
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts"
arch=(i686 x86_64)
license=('LGPL')
depends=('libgnomecanvas>=2.20.1' 'libnotify>=0.4.4')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
groups=('gnome-extra')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4e1e1f080e7253ee4f6a5cee3306c78d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
