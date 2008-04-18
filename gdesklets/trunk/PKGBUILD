# $Id$
# Committer: nifan <carlos@nifan.tk>
# Mantainer: Roman Kyrylych <roman@archlinux.org>

pkgname=gdesklets
pkgver=0.36.0
pkgrel=1
pkgdesc="gDesklets provides an advanced architecture for desktop applets."
arch=('i686' 'x86_64')
license=('GPL')
url="http://gdesklets.de/"
depends=('libgtop>=2.14.8-2' 'librsvg>=2.16.0' 'libgnomeui>=2.18.1-2'
         'gnome-python>=2.18.0' 'gconf>=2.18.0.1-4' 'desktop-file-utils')
makedepends=('perlxml' 'swig')
install=gdesklets.install
source=(http://gdesklets.de/files/gdesklets-0.36.tar.bz2)
md5sums=('766727f18f904968b622e7696fc9199b')
options=('!libtool')

build() {
  cd $startdir/src/gdesklets-0.36
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1

  make UPDATE_MIME_DATABASE=/bin/true UPDATE_DESKTOP_DATABASE=/bin/true \
    GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
