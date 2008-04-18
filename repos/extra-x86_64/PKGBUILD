# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=goffice
pkgver=0.6.2
pkgrel=1
pkgdesc="A library of document-centric objects and utilities built on top of GLib and Gtk+"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.20' 'libgsf-gnome>=1.14')
# gtk-doc is needed because you can't shut off doc building it seems
makedepends=('perlxml' 'pkgconfig' 'gtk-doc')
optdepends=('libxml2' 'libsm' 'gtk2' 'popt')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2)
options=(!libtool)
md5sums=('f52d78cffbcfc3c13336fd308ea3926e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
