# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=pygtk
pkgver=2.12.1
pkgrel=1
pkgdesc="Python bindings for the GTK widget set"
arch=(i686 x86_64)
license=('LGPL')
depends=('libglade>=2.6.2' 'pycairo>=1.4.0' 'pygobject>=2.14.1' 'python-numeric>=24.2-2' 'gtk2>=2.12.0')
options=('!libtool')
url="http://www.pygtk.org/"
source=(http://ftp.gnome.org/pub/gnome/sources/pygtk/2.12/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a816346d750d61e3fa67a200e4292694')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e 's/SUBDIRS = codegen . $(GTK_SUBDIR) examples tests docs/SUBDIRS = codegen . $(GTK_SUBDIR) examples tests/' Makefile.in
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -m644 gtk/gtk-extrafuncs.defs ${startdir}/pkg/usr/share/pygtk/2.0/defs/
}
