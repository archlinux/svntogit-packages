# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=librsvg
pkgver=2.22.2
pkgrel=1
pkgdesc="SAX-based renderer for SVG files into a GdkPixbuf"
arch=(i686 x86_64)
license=('LGPL')
depends=('gtk2>=2.12.9' 'libcroco>=0.6.1' 'libgsf>=1.14.8')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool')
url="http://librsvg.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
install=librsvg.install
md5sums=('aae602677ce201b1a0ed6a0c18c207f2')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname} \
              --with-croco \
	      --disable-mozilla-plugin --with-svgz
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${startdir}/pkg/usr/share/gtk-doc
  rm -rf ${startdir}/pkg/usr/lib/mozilla
  rm ${startdir}/pkg/usr/lib/gtk-2.0/*/{engines,loaders}/*.a
}
