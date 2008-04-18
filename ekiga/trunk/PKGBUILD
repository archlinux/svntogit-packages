# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

pkgname=ekiga
pkgver=2.0.12
pkgrel=1
pkgdesc="VOIP/Videoconferencing app with full SIP and H.323 support (GnomeMeeting expanded and renamed)"
url="http://www.ekiga.org"
license=(GPL)
arch=(i686 x86_64)
depends=('opal>=2.2.11' 'libgnomeui>=2.22.01' 'evolution-data-server>=2.22.0' 'desktop-file-utils')
makedepends=('pkgconfig' 'perlxml' 'gnome-doc-utils>=0.12.2')
provides=('gnomemeeting')
replaces=('gnomemeeting')
options=(!emptydirs)
install=ekiga.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d86636c2195b4fb95aec427c17570008')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var \
	      --disable-scrollkeeper --enable-dbus || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas 
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
