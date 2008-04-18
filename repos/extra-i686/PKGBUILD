# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=gnome-user-share
pkgver=0.11
pkgrel=1
pkgdesc="Easy to use user-level file sharing for GNOME."
arch=(i686 x86_64)
url="http://ftp.gnome.org/pub/GNOME/sources/gnome-user-share/"
license=('GPL')
depends=('avahi' 'gconf>=2.18.0.1-2' 'libglade')
makedepends=('perlxml' 'pkgconfig')
install=gnome-user-share.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4961e49c858fbb7d6050c62a73286d74')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gnome-user-share \
              --localstatedir=/var \
              --enable-avahi --disable-howl
  make || return 1
  make DESTDIR=${startdir}/pkg install
  
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
