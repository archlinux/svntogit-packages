# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=libsndfile
pkgver=1.0.25
pkgrel=3
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac' 'libvorbis')
checkdepends=('python2')
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz{,.asc})
sha1sums=('e95d9fca57f7ddace9f197071cbcfb92fa16748e'
          'a93d26016730cb9fa214c753d079ee77dca1f326')
validpgpkeys=('73571E85C19F4281D8C97AA86CA41A7743B8D6C8')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' src/binheader_writef_check.py \
    src/create_symbols_file.py programs/test-sndfile-metadata-set.py
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-sqlite
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
