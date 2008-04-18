#$Id$
# Maintainer: Jan de Groot <jgc@arclinux.org>

pkgname=gnome-mount
pkgver=0.7
pkgrel=1
pkgdesc="GNOME mount program"
arch=(i686 x86_64)
license=('GPL')
url="http://hal.freedesktop.org/"
depends=('hal>=0.5.10' 'gnome-keyring>=2.20.1' 'gconf>=2.20.1'
         'libnotify>=0.4.4')
makedepends=('pkgconfig' 'perlxml' 'nautilus>=2.20.0')
options=('!libtool')
groups=('gnome')
install=gnome-mount.install
source=(http://hal.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('6a2f14925376c2c494df89cbfbdb2ca5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
