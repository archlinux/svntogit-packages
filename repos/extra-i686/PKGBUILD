# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Michel Brabants <michel.linux@tiscali.be>

pkgname=seahorse
pkgver=2.22.0
pkgrel=1
pkgdesc="GNOME application for managing PGP keys."
arch=(i686 x86_64)
license=('GPL')
url="http://seahorse.sourceforge.net/"
depends=('libgnomeui>=2.22.01' 'libnotify>=0.4.4' 'libsoup>=2.4.0' 'gpgme' 'desktop-file-utils' 'zip')
makedepends=('gettext' 'libldap' 'perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.0' 'nautilus>=2.22.0' 'epiphany>=2.22.0' 'gnome-panel>=2.22.0' 'gedit>=2.22.0')
options=('!libtool' '!emptydirs')
groups=('gnome-extra')
replaces=('gnome-keyring-manager')
install=seahorse.install
source=(http://ftp.gnome.org/pub/GNOME/sources/seahorse/2.22/seahorse-${pkgver}.tar.bz2)
md5sums=('5dd87139d872c51c17de55ab4779a52a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --enable-ldap --enable-hkp \
	      --enable-gedit --enable-nautilus \
	      --enable-agent --enable-libnotify \
	      --disable-scrollkeeper --disable-update-mime-database || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
