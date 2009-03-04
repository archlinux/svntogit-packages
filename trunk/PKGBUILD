# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libsndfile
pkgver=1.0.19
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac>=1.2.1')
options=('!libtool')
source=(http://www.mega-nerd.com/libsndfile/${pkgname}-${pkgver}.tar.gz)
md5sums=('8fa24b0c0a8758543427c9741ea06924')
sha1sums=('7cf8d3f032501642e36fecd8c899b09d3f7c986c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-sqlite || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
