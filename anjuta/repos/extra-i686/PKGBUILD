# $Id$
# Mantainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Harley Laue <losinggeneration@yahoo.com>

pkgname=anjuta
pkgver=2.4.0
pkgrel=1
pkgdesc="Anjuta Integrated Development Environment (IDE)"
arch=('i686' 'x86_64')
license="GPL"
depends=('autogen' 'devhelp>=0.18-2' 'gnome-build>=0.2.0' 'pcre>=7.6-3' 'vte>=0.16.13' 'graphviz>=2.18' 'subversion>=1.4.5-4' 'libgnomeprintui>=2.18.2' 'gtksourceview>=1.8.5-2' 'glade>=3.4.1' 'gconf>=2.22.0-1' 'libxslt>=1.1.22')
makedepends=('gnome-doc-utils>=0.12.0-1')
url="http://anjuta.sourceforge.net/"
install=anjuta.install
source=(http://downloads.sourceforge.net/sourceforge/anjuta/anjuta-$pkgver.tar.bz2)  
options=('!libtool' '!emptydirs')
md5sums=('5eca972ef7b95de85a8088eaf9cc0753')

build() {
  cd ${startdir}/src/anjuta-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-plugin-subversion --enable-plugin-glade \
		--enable-plugin-class-inheritance --enable-plugin-valgrind \
		--enable-plugin-sourceview --disable-gtk-doc \
		--enable-debug --disable-scrollkeeper
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
   
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
