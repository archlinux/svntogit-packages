# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=ggv
pkgver=2.12.0
pkgrel=2
pkgdesc="Postscript viewer"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.18.1-2' 'ghostscript' 'scrollkeeper' 'desktop-file-utils')
makedepends=('perlxml' 'pkgconfig')
url="http://www.gnome.org"
install=ggv.install
source=(http://ftp.gnome.org/pub/gnome/sources/ggv/2.12/ggv-${pkgver}.tar.bz2)
md5sums=('418f0ef3f8b82bb0c423a2a1cf6769f7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi

  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/ggv \
              --localstatedir=/var
  make || return 1
  make GCONF_DISABLE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas

}
