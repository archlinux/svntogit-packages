# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=ccache
pkgver=2.4
pkgrel=4
pkgdesc="ccache is a compiler cache"
url="http://ccache.samba.org/"
source=(http://samba.org/ftp/ccache/$pkgname-$pkgver.tar.gz)
license=(GPL)
arch=(i686 x86_64)
depends=(glibc)
md5sums=('73c1ed1e767c1752dd0f548ec1e66ce7')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  install -Dm 755 ccache $startdir/pkg/usr/bin/ccache
  install -Dm 644 ccache.1 $startdir/pkg/usr/man/man1/ccache.1

  mkdir -p $startdir/pkg/usr/lib/ccache/bin
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/cc 
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/gcc
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/g++
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/cpp
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/c++
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/${CHOST}-cc
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/${CHOST}-gcc
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/${CHOST}-g++
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/${CHOST}-cpp
  ln -sf /usr/bin/ccache $startdir/pkg/usr/lib/ccache/bin/${CHOST}-c++
}
