# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gtksourceview2
pkgver=2.2.1
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('gtk2>=2.12.9' 'libxml2>=2.6.31')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/gtksourceview/2.2/gtksourceview-${pkgver}.tar.bz2)
md5sums=('1c5bd86f854ead3aedb96463ebbb275f')

build() {
  cd ${startdir}/src/gtksourceview-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
