# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=evolution-sharp
pkgver=0.16.1
pkgrel=1
pkgdesc="C# bindings for Novell Evolution"
arch=(i686 x86_64)
license=('GPL')
url="http://ftp.gnome.org/pub/GNOME/sources/evolution-sharp/"
depends=('evolution-data-server>=2.22.0')
makedepends=('pkgconfig' 'gtk-sharp-2')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/0.16/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1f7ba3c3f99c17458af98c2c207001fd')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  export MONO_SHARED_DIR="${startdir}/src/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/lib/libevolutionglue.a
} 

