# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=gtk-doc 
pkgver=1.10
pkgrel=1
options=('docs')
pkgdesc="Used to document the public API of libraries" 
arch=(i686 x86_64)
license=('GPL' 'FDL')
depends=('perl>=5.8.8' 'rarian' 'docbook-xsl') 
makedepends=('pkgconfig' 'jade')
install=gtk-doc.install
url="http://www.gtk.org/gtk-doc/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2) 
md5sums=('cbd4be396b0cf8b8ce1fc9b927cdf451')

build() { 
  cd ${startdir}/src/${pkgname}-${pkgver} 
  ./configure --prefix=/usr || return 1
  make || return 1 
  make DESTDIR=${startdir}/pkg install || return 1
}
