# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=libsndfile
pkgver=1.0.25
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac' 'libvorbis')
options=('!libtool')
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('e2b7bb637e01022c7d20f95f9c3990a2')
sha1sums=('e95d9fca57f7ddace9f197071cbcfb92fa16748e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-sqlite
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
