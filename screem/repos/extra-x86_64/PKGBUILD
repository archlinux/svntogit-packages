# $Id$
# Maintainer: Roberto Carvajal <roberto@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=screem
pkgver=0.16.1
pkgrel=6
pkgdesc="A source oriented web site development environment for GNOME"
arch=(i686 x86_64)
license=('GPL')
url="http://www.screem.org"
depends=('gtksourceview>=1.8.5-2' 'libgtkhtml>=2.11.0' 'libgnomeui>=2.18.1-2' 'libcroco'
         'libgnomeprintui>=2.18.0' 'startup-notification>=0.9' 'enchant'
	 'gnome-menus>=2.18.0-2' 'scrollkeeper' 'desktop-file-utils')
makedepends=('perlxml' 'pkgconfig')
options=('nolibtool')
install=screem.install
source=(http://heanet.dl.sourceforge.net/sourceforge/screem/screem-${pkgver}.tar.gz
	goption.patch
	dbus-dontclose.patch)
md5sums=('88bfc0afadb905ddbed9bdfbc869602a' 'd8f855a89a6f1479085cd88956d773c1'
	 '2a26231fbab056165d84bad03dfb3edd')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi

  patch -Np0 -i ${startdir}/src/goption.patch || return 1
  patch -Np1 -i ${startdir}/src/dbus-dontclose.patch || return 1

  sed -e 's/-DGNOME_DISABLE_DEPRECATED//g' \
      -e 's/-DGNOMEUI_DISABLE_DEPRECATED//g' \
      -e 's/-DGTK_DISABLE_DEPRECATED//g' \
      -i configure

  ./configure --prefix=/usr --sysconfdir=/etc \
        --localstatedir=/var \
	--with-ssl --with-included-neon \
	--disable-update-mime \
	--disable-update-desktop \
	--enable-dbus \
	--enable-enchant
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
