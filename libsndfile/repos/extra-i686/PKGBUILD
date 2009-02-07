# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libsndfile
pkgver=1.0.18
pkgrel=1
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac>=1.2.1')
options=('!libtool')
source=(http://www.mega-nerd.com/libsndfile/${pkgname}-${pkgver}.tar.gz)
md5sums=('9fde6efb1b75ef38398acf856f252416')
sha1sums=('d0fb643dc5b1030cf769e06d1260c70320fc877e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-sqlite || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
