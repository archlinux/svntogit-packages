# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libsndfile
pkgver=1.0.20
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac>=1.2.1')
options=('!libtool')
source=(http://www.mega-nerd.com/libsndfile/${pkgname}-${pkgver}.tar.gz)
md5sums=('e0553e12c7a467af44693e95e2eac668')
sha1sums=('d4f88b919c644f54dd4038c4cf4fb2e7b0d32f7b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-sqlite || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
