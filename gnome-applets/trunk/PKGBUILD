# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-applets
pkgver=2.22.1
pkgrel=1
pkgdesc="GNOME Applets"
arch=(i686 x86_64)
license=('GPL')
depends=('gstreamer0.10-base-plugins' 'gnome-panel>=2.22.1' 'libgtop>=2.22.1' 'gucharmap>=2.22.1' 'libnotify>=0.4.4' 'cpufrequtils' 'libgnomekbd>=2.22.0')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig' 'gnome-settings-daemon>=2.22.0')
options=(!emptydirs)
url="http://www.gnome.org"
groups=(gnome)
install=gnome-applets.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2
	80_mixer_user_gstreamer_signals.patch)
md5sums=('d6df0a48c875b77a4fafe47fc81bde29'
         'dc3f188370741bca83a610761b3ca65d')
	
build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/80_mixer_user_gstreamer_signals.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gnome-applets \
              --localstatedir=/var --disable-static \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
  rm -f ${startdir}/pkg/usr/lib/*.la

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
