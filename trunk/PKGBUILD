# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libmp4v2
pkgver=1.5.0.1
pkgrel=1
pkgdesc="Mpeg-4 library and tools from mpeg4ip"
arch=(i686)
url="http://mpeg4ip.sourceforge.net/"
depends=(gcc)
options=(NOLIBTOOL)
source=(http://heanet.dl.sourceforge.net/sourceforge/mpeg4ip/mpeg4ip-${pkgver}.tar.gz)
md5sums=()

build() {
  cd ${startdir}/src/mpeg4ip-${pkgver}
  touch bootstrapped
  echo "" > lib/rtp/configure
  echo "" > lib/SDLAudio/configure

  ./configure --prefix=/usr
  for dir in lib/gnu lib/mp4av lib/mp4v2; do
    cd ${startdir}/src/mpeg4ip-${pkgver}/${dir}
    make || return 1
    make DESTDIR=${startdir}/pkg install
  done
  install -m644 ${startdir}/src/mpeg4ip-${pkgver}/include/mpeg4ip{,_version}.h ${startdir}/pkg/usr/include/
  install -m644 $startdir/src/mpeg4ip-$pkgver/mpeg4ip_config.h $startdir/pkg/usr/include/
}
