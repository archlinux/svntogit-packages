# $Id$
# Jan de Groot <jgc@archlinux.org>

pkgname=eog
pkgver=2.22.0
pkgrel=1
pkgdesc="Eye of Gnome: An image viewing and cataloging program"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop>=2.22.0' 'libexif>=0.6.16' 'lcms>=1.17' 'desktop-file-utils' 'gnome-icon-theme>=2.22.0' 'exempi>=1.99.9-2')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2')
install=eog.install
groups=('gnome-extra')
options=(!emptydirs)
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('53928253e8f0265b6e7de80bfc51ab3a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
