# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libsoup
pkgver=2.4.1
pkgrel=1
pkgdesc="Gnome HTTP Library"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.16.3' 'gnutls>=2.0.4' 'libxml2>=2.6.30')
makedepends=('perlxml' 'pkgconfig')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.4/${pkgname}-${pkgver}.tar.bz2)
options=('!libtool' '!emptydirs')
md5sums=('d0fc91ccb9da401e9e40d2f4612bdac9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
