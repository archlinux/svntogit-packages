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
checkdepends=('python2')
options=('!libtool')
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz{,.asc})
sha1sums=('e95d9fca57f7ddace9f197071cbcfb92fa16748e'
          'a93d26016730cb9fa214c753d079ee77dca1f326')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' src/binheader_writef_check.py \
    src/create_symbols_file.py programs/test-sndfile-metadata-set.py
  ./configure --prefix=/usr --disable-sqlite
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
