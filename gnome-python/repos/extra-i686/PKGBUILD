# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=gnome-python
pkgver=2.22.0
pkgrel=1
pkgdesc="gnome-python is a set of interfaces to gnome-libs."
arch=(i686 x86_64)
license=('LGPL')
depends=('pygtk>=2.12.1' 'pyorbit>=2.14.2' 'libgnomeui>=2.22.01')
makedepends=('pkgconfig')
options=('!libtool')
url="http://www.pygtk.org/"
source=(http://ftp.gnome.org/pub/gnome/sources/gnome-python/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ff84c54314adec195149c59365e35a13')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1 
  make DESTDIR=${startdir}/pkg install || return 1
}
