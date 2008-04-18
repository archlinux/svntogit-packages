# $Id$ 
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-themes
pkgver=2.22.0
pkgrel=1
pkgdesc="Default themes for GNOME2"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk-engines>=2.14.0')
url="http://www.gnome.org"
groups=('gnome')
replaces=('gtk-thinice-engine' 'clearlooks-gtk2')
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-themes/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e902194175c6f7298bd53e5aa7eef56b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
