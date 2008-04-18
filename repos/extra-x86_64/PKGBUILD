# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=flac
pkgver=1.2.1
pkgrel=1
pkgdesc="Free Lossless Audio Codec"
license=('custom:Xiph' 'LGPL' 'GPL' 'FDL')
url="http://flac.sourceforge.net/"
arch=(i686 x86_64)
options=('!libtool')
depends=('glibc' 'libogg')
makedepends=('nasm' 'xmms')
source=(http://downloads.sf.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('153c8b15a54da428d1f0fadc756c22c7')

build() {
  # -j1 to get the xmms plugin working (from gentoo)
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$pkgver || return 1
  ./configure --prefix=/usr --enable-shared --disable-sse \
    --disable-rpath --with-pic || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # install license
  install -Dm0644 $startdir/src/$pkgname-$pkgver/COPYING.Xiph \
                  $startdir/pkg/usr/share/licenses/$pkgname/COPYING.Xiph
}

