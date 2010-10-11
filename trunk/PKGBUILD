# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=libsndfile
pkgver=1.0.23
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac' 'libvorbis')
options=('!libtool')
changelog=ChangeLog
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('d0e22b5ff2ef945615db33960376d733')
sha1sums=('dee36861b503fe7754f0131364523f45720a0914')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-sqlite
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
