# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributer: Ben <contrasutra@myrealbox.com>

pkgname=sound-juicer
pkgver=2.22.0
pkgrel=1
pkgdesc="A cd ripper application"
arch=(i686 x86_64)
license=('GPL')
depends=('taglib>=1.4' 'libcdio>=0.79' 'musicbrainz>=2.1.5'
	 'gnome-media>=2.22.0' 'gstreamer0.10-cdparanoia'
	 'gstreamer0.10-gnomevfs' 'nautilus-cd-burner>=2.22.0')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
options=(!emptydirs)
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
groups=('gnome-extra')
install=sound-juicer.install
url="http://www.burtonini.com/blog/computers/sound-juicer"
md5sums=('20f83a28915b7d7029198396258d1b4f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --enable-hal \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$startdir/pkg install || return 1
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
