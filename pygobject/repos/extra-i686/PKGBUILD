# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=pygobject
pkgver=2.14.1
pkgrel=1
pkgdesc="Python bindings for GObject"
arch=(i686 x86_64)
license=('LGPL')
depends=('python>=2.5.1-5' 'glib2>=2.14.5')
source=(http://ftp.gnome.org/pub/gnome/sources/pygobject/2.14/${pkgname}-${pkgver}.tar.bz2)
options=('!libtool')
url="http://www.pygtk.org/"
md5sums=('d403998bc0c5034b21bd75ae7b704f4a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
