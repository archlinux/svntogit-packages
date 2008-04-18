# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=guile-gtk
pkgver=1.2_0.60
pkgrel=1
pkgdesc="Guile-gtk is glue code to make the GTK+ (the Gimp Toolkit) accessible from Guile"
arch=(i686 x86_64)
depends=('guile>=1.8.1' 'gdk-pixbuf' 'gtkglarea')
options=('nolibtool')
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-0.60.tar.gz)
url="http://www.nongnu.org/guile-gtk/"
md5sums=('61a2e4d9326b40b65ce6c68bf1feb5db')

build() {
  cd ${startdir}/src/${pkgname}-0.60
  ./configure --prefix=/usr
  make || return 1
  export MAKEFLAGS="-j1"
  make DESTDIR=${startdir}/pkg install
}
