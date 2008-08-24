# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=pygtksourceview2
pkgver=2.2.0
pkgrel=1
pkgdesc="Python bindings for gtksourceview2"
arch=(i686 x86_64)
license=('GPL')
depends=('gtksourceview2>=2.2.0' 'pygobject>=2.14.1')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/pygtksourceview/2.2/pygtksourceview-${pkgver}.tar.bz2)
md5sums=('5dd0a9aa99168f989ed04123a65077e4')

build() {
  cd ${startdir}/src/pygtksourceview-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
	--localstatedir=/var --disable-static --disable-docs || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
