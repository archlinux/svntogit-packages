# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Original Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# New Version - Contributor: Bob Finch <w9ya@arrl.net>
# with help from J. Santiago Hirschfeld <jsantiagoh@yahoo.com.ar> aka Angelus

pkgname=wxgtk
pkgver=2.8.7
pkgrel=1
pkgdesc="wxGTK - GTK+ implementation of wxWidgets API for GUI"
arch=('i686' 'x86_64')
url="http://wxwidgets.org"
license=('custom:wxWindows')
depends=('gtk2>=2.10.9' 'mesa')
source=(http://downloads.sourceforge.net/wxwindows/wxGTK-${pkgver}.tar.bz2)
md5sums=('b25e85eeee524903214ebb520753f4bd')

build() {
  cd ${startdir}/src/wxGTK-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib --with-gtk=2 --with-opengl --enable-unicode \
	  --enable-graphics_ctx --without-gnomeprint --disable-optimize || return 1
  make || return 1
  make -C locale allmo
  make DESTDIR=${startdir}/pkg install || return 1
  cd contrib/src
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 ../../docs/licence.txt $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
