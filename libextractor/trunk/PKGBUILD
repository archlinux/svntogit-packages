# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libextractor
pkgver=0.5.20
pkgrel=1
pkgdesc="libextractor is a library used to extract meta-data from files of arbitrary type"
arch=("i686" "x86_64")
license=('GPL')
# url="http://ovmj.org/libextractor/"
url="http://gnunet.org/libextractor/"
depends=('gcc-libs>=4.1' 'glib2' 'bzip2' 'zlib' 'libvorbis' 'libtool>=2.2' 'gtk2' 'libgsf' 'libmpeg2' 'libxml2')
options=('!libtool' '!makeflags')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('b71833f1c1b8299b01df2d7669600030')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-shared --disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install
}
