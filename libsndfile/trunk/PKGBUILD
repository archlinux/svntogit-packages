# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=libsndfile
pkgver=1.0.22
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac' 'libvorbis')
options=('!libtool')
changelog=ChangeLog
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('79b6ee2c33c878448c67698e1bf85378')
sha1sums=('2bf823dcacf8ee78c56b8a877672753ee24d9d3b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-sqlite
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
