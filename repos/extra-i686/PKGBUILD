# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=0.11.5
pkgrel=1
pkgdesc="Menu editor for gnome"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.realistanew.com/projects/alacarte/"
depends=('gnome-menus>=2.22.0' 'gnome-python>=2.22.0')
makedepends=('perlxml' 'pkgconfig')
install=alacarte.install
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.11/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e4dc193d36c76b974e66e517e9c7ea33')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1 
  make DESTDIR=${startdir}/pkg install || return 1
}
