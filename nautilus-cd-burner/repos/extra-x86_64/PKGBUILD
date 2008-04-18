# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=nautilus-cd-burner
pkgver=2.22.0
pkgrel=1
pkgdesc="Adds cd burner functionality to nautilus"
arch=(i686 x86_64)
depends=('cdrkit' 'dvd+rw-tools' 'gnome-mount>=0.7' 'desktop-file-utils' 'libgnomeui>=2.22.01')
makedepends=('perlxml' 'pkgconfig' 'nautilus>=2.22.0')
options=('!libtool' '!emptydirs')
license=('GPL')
install=nautilus-cd-burner.install
source=(http://ftp.gnome.org/pub/GNOME/sources/nautilus-cd-burner/2.22/${pkgname}-${pkgver}.tar.bz2)
groups=('gnome-extra')
md5sums=('e75c61879a12ab329fd2f3081b7e5d76')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/nautilus-cd-burner \
              --localstatedir=/var --enable-hal || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
