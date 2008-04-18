# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=foobillard
pkgver=3.0a
pkgrel=2
pkgdesc="An OpenGL billiard game for Linux"
arch=(i686 x86_64)
depends=(sdl freetype2 glibc libpng)
url="http://foobillard.sunsite.dk/"
source=(http://foobillard.sunsite.dk/dnl/$pkgname-$pkgver.tar.gz)
md5sums=('c2d92edeaaf8bfb18aa26f1c79931b7d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  # fix startup bug in youregon.ttf and freetype2
  sed -i -e 's/youregon.ttf/bluebold.ttf/g' src/options.h
  make || return 1
  make prefix=$startdir/pkg/usr install
}
