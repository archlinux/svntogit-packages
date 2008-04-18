# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

pkgname=gnucash
pkgver=2.2.4
pkgrel=1
pkgdesc="A personal and small-business financial-accounting application"
arch=(i686 x86_64)
url="http://www.gnucash.org"
license=("GPL")
depends=('gtkhtml' 'swig' 'slib' 'goffice>=0.6.2' 'libgnomeprintui' 'guile')
makedepends=('texinfo' 'intltool')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
install=${pkgname}.install
md5sums=('27e660297dc5b8ce574515779d05a5a5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas/gnucash \
              --disable-schemas-install

  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -rf ${startdir}/pkg/usr/share/info || return 1
}
