# $Id$
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=libsndfile
pkgver=1.0.27
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac' 'libvorbis')
checkdepends=('python2')
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz)
sha1sums=('e112d4937352d1722b06911b00c79e9bce15095c')
validpgpkeys=('73571E85C19F4281D8C97AA86CA41A7743B8D6C8')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' src/binheader_writef_check.py \
    src/create_symbols_file.py programs/test-sndfile-metadata-set.py
  sed -i 's|python|&2|' src/Makefile.am
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
