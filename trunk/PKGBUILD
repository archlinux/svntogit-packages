# $Id: PKGBUILD,v 1.11 2007/09/30 11:09:36 tpowa Exp $
# Maintainer: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=libsndfile
pkgver=1.0.17
pkgrel=2
options=(!libtool)
pkgdesc="a C library for reading and writing files containing sampled sound"
arch=(i686 x86_64)
url="http://www.mega-nerd.com/libsndfile"
depends=('alsa-lib' 'flac>=1.1.4')
source=(http://www.mega-nerd.com/libsndfile/$pkgname-$pkgver.tar.gz flac-1.1.4.patch flac-buffer-overflow.patch)
md5sums=('2d126c35448503f6dbe33934d9581f6b' '87efbec75b3321e4a015ad2dfc3ee965')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../flac-1.1.4.patch || return 1
  patch -Np1 -i ../flac-buffer-overflow.patch || return 1
  aclocal
  automake
  ./configure --prefix=/usr --disable-sqlite
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('2d126c35448503f6dbe33934d9581f6b'
         '87efbec75b3321e4a015ad2dfc3ee965'
         '6cd2ad05491221f1d3a0e3e5131a5642')
