# $Id$
# Contributor: damir <damir@archlinux.org>
# Maintainer: Paul Mattal <paul@archlinux.org>

pkgname=x264
pkgver=20071202
pkgrel=1
pkgdesc="free library for encoding H264/AVC video streams"
arch=(i686 x86_64)
license=('GPL')
depends=('libx11')
makedepends=('nasm')
[ "${CARCH}" = "x86_64" ] && makedepends=('yasm')
url="http://www.videolan.org/developers/x264.html"
source=(ftp://ftp.videolan.org/pub/videolan/x264/snapshots/x264-snapshot-${pkgver}-2245.tar.bz2)
md5sums=('372b3da8eb5881260d7e4250110c89db')

build() {
    cd ${startdir}/src/$pkgname-snapshot-${pkgver}-2245 || return 1
    ./configure \
        --enable-pthread \
        --enable-visualize \
	--enable-shared \
	--enable-pic || return 1
    make || return 1
    make DESTDIR=${startdir}/pkg \
         bindir=/usr/bin \
         mandir=/usr/man \
         libdir=/usr/lib/ \
         includedir=/usr/include/ \
       install || return 1
}
