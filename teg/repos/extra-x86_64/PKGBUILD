# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Adam Griffiths

pkgname=teg
pkgver=0.11.2
pkgrel=1
pkgdesc="Tenes Empanadas Graciela - A risk clone for Gnome 2"
arch=(i686 x86_64)
license=('GPL')
url="http://teg.sourceforge.net/"
depends=('libgnomeui>=2.18.1-2')
makedepends=('intltool' 'pkgconfig')
install=teg.install
source=("http://easynews.dl.sourceforge.net/sourceforge/teg/teg-$pkgver.tar.gz")

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --with-readline
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/applications
  mv    ${startdir}/pkg/usr/share/gnome/apps/Games/teg.desktop \
        ${startdir}/pkg/usr/share/applications/teg.desktop
  rm -rf ${startdir}/pkg/opt/gnome/share/gnome/apps

  sed -i '10iCategories=GNOME;Game;' \
        ${startdir}/pkg/usr/share/applications/teg.desktop

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
