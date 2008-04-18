# $Id$ 
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=pango
pkgver=1.20.2
pkgrel=2
pkgdesc="A library for layout and rendering of text"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.16.3' 'cairo>=1.6.4' 'libxft>=2.1.12' 'libthai>=0.1.9')
makedepends=('pkgconfig' 'libxt')
options=('!libtool' '!emptydirs')
install=pango.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.20/${pkgname}-${pkgver}.tar.bz2)
url="http://www.gtk.org/"
md5sums=('b90d82bb5a92c7dd346c1eac97285e37')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --without-qt || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
