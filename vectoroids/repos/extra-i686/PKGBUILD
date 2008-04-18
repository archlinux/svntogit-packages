# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=vectoroids
pkgver=1.1.0
pkgrel=2
pkgdesc="Vectoroids is based on the X-Window PDA game 'Agendaroids,'"
depends=('sdl_mixer' 'sdl_image')
source=(ftp://ftp.sonic.net/pub/users/nbs/unix/x/vectoroids/$pkgname-$pkgver.tar.gz)
url="http://www.newbreedsoftware.com/vectoroids/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/bin
  make PREFIX=/usr DATA_PREFIX=/usr/share/vectoroids/ || return 1
  make PREFIX=$startdir/pkg/usr install
}
