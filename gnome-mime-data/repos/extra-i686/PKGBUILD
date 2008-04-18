# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-mime-data
pkgver=2.18.0
pkgrel=3
pkgdesc="The base MIME and Application database for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('shared-mime-info') 
makedepens=('perlxml')
url="http://www.gnome.org"
groups=('gnome')
source=(ftp://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.18/${pkgname}-${pkgver}.tar.bz2)
md5sums=('541858188f80090d12a33b5a7c34d42c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/lib
  mv ${startdir}/pkg/usr/share/pkgconfig ${startdir}/pkg/usr/lib/
}
