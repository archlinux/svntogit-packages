# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=streamripper
pkgver=1.62.3
pkgrel=1
pkgdesc="Splits SHOUTcast stream into tracks"
arch=("i686" "x86_64")
url="http://streamripper.sourceforge.net"
license=('GPL')
depends=('glibc' 'libmad' 'faad2' 'libvorbis')
options=('!libtool')
# source=($url/files/$pkgname-$pkgver.tar.gz)
source=("http://downloads.sourceforge.net/sourceforge/streamripper/streamripper-$pkgver.tar.gz")
md5sums=('127eb52355d0d10183ee22c44b5a9039')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr \
              --with-included-tre
  make || return 1
  make DESTDIR=$startdir/pkg install
}
