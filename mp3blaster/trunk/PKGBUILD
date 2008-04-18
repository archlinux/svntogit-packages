# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=mp3blaster
pkgver=3.2.3
pkgrel=3
pkgdesc="A console based mp3 and OGG player."
depends=('ncurses' 'libvorbis' 'sdl')
arch=(i686 x86_64)
license=('GPL')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        ftp://ftp2.de.debian.org/pub/debian/pool/main/m/mp3blaster/mp3blaster_3.2.3-3.diff.gz \
		  mp3blaster-3.2.3-cdfs.patch)
url="http://mplayer.sf.net"

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ${startdir}/src/mp3blaster_3.2.3-3.diff || return 1
  for fn in debian/patches/*; do
    patch -Np1 -i ${fn}
  done
  patch -Np1 -i ${startdir}/src/mp3blaster-3.2.3-cdfs.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
md5sums=('0d892d7c99df175eb0efb2bc31086285'
         'ee5ad4ed48a3eebf2bc45ff09210ebd6'
         '2a555430e0511077ea21535760a189bc')
