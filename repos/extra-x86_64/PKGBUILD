# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libsndfile
pkgver=1.0.21
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac>=1.2.1' 'libvorbis')
makedepends=('jack-audio-connection-kit')
optdepends=('jack-audio-connection-kit: for JACK support')
options=('!libtool')
source=(http://www.mega-nerd.com/libsndfile/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('880a40ec636ab2185b97f8927299b292')
sha1sums=('136845a8bb5679e033f8f53fb98ddeb5ee8f1d97')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-sqlite || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
