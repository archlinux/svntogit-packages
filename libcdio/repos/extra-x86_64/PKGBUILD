# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=libcdio
pkgver=0.80
pkgrel=2
pkgdesc="GNU Compact Disc Input and Control Library"
arch=("i686" "x86_64")
license=('GPL')
url="http://www.gnu.org/software/libcdio/"
depends=('gcc-libs>=4.3.0' 'libcddb' 'ncurses')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/libcdio/$pkgname-$pkgver.tar.gz)
md5sums=('6495add276ed11b7ac8a88092799ab4f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-vcd-info || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -m644 libcdio_paranoia.pc libcdio_cdda.pc \
    ${startdir}/pkg/usr/lib/pkgconfig/ || return 1
}

