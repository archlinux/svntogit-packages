# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=fast-user-switch-applet
pkgver=2.20.0
pkgrel=2
pkgdesc="An applet for the GNOME panel which provides a menu to switch between users."
arch=(i686 x86_64)
license=('GPL')
url="http://ignore-your.tv/fusa/"
depends=('gnome-panel>=2.20.0' 'libxmu' 'gdm>=2.20.0')
makedepends=('perlxml' 'pkgconfig')
options=(!emptydirs)
install=fusa.install
source=(http://ftp.gnome.org/pub/GNOME/sources/fast-user-switch-applet/2.20/${pkgname}-${pkgver}.tar.bz2
	fast-user-switch-applet-2.17.4-socket-check.patch
	startx.patch)
md5sums=('1d1fd25b5599f7656e3fa89aa913137c'
         '4af91d6f78a87d8e126ad88b0ff399ea'
         '36b9bf8dac0c0187eefc122b84f09d3d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/startx.patch || return 1
  patch -Np1 -i ${startdir}/src/fast-user-switch-applet-2.17.4-socket-check.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/fast-user-switch-applet \
              --localstatedir=/var --disable-scrollkeeper \
              --with-gdm-setup=/usr/sbin/gdmsetup \
              --with-gdm-config=/etc/gdm/custom.conf
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
