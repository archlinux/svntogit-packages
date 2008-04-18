# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=dasher
pkgver=4.7.0
pkgrel=1
pkgdesc="Information-efficient text-entry interface, driven by natural continuous pointing gestures"
arch=(i686 x86_64)
license=('GPL')
depends=('at-spi>=1.22.0' 'libgnomeui>=2.22.01' 'gnome-speech>=0.4.18')
makedepends=('pkgconfig' 'intltool' 'gnome-doc-utils>=0.12.2')
url="http://www.gnome.org"
groups=('gnome-extra')
options=(!emptydirs)
install=dasher.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/4.7/${pkgname}-${pkgver}.tar.bz2
	compile-fixes.patch
	gcc-4.3.patch)
md5sums=('83fe6b7d3327baadcf350da19bfe7ce4'
         'c9cef3ddcb3cd4e718464a3b728c03da'
         '2ef2dc940df24ca9796bbb628967ea56')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/compile-fixes.patch || return 1
  patch -Np0 -i ${startdir}/src/gcc-4.3.patch || return 1
  intltoolize --force --copy || return 1
  gnome-doc-prepare --force || return 1
  libtoolize --force --copy || return 1
  aclocal || return 1
  autoconf || return 1
  automake || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var \
	      --disable-scrollkeeper --enable-speech || return 1
  make LDFLAGS+=-Wl,--export-dynamic || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
