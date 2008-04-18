# $Id$
# Maintainer: Jan de Groot  <jgc@archlinux.org>
pkgname=libwnck
pkgver=2.22.1
pkgrel=1
pkgdesc="Window Navigator Construction Kit"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.12.9' 'startup-notification>=0.9' 'libxres')
makedepends=('pkgconfig' 'perlxml' 'libxt')
options=('!libtool')
url="http://www.gnome.org/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6b16643a107d9fc37136335939ab3f1a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
