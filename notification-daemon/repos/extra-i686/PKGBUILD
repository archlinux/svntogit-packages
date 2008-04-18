# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname="notification-daemon"
pkgver=0.3.7
pkgrel=3
pkgdesc="Notification daemon for the desktop notifications framework"
arch=(i686 x86_64)
license=('GPL')
url="http://www.galago-project.org/specs/notification/"
depends=('dbus-glib>=0.73' 'libsexy>=0.1.11' 'libwnck>=2.20.0' 'gconf>=2.20.0')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
install=notification-daemon.install
source=(http://www.galago-project.org/files/releases/source/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cbeae0f29a15ff93f0b763d9e1cdf1de')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/notification-daemon \
              --localstatedir=/var --disable-static
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$startdir/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
