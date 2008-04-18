# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>
# Maintainer: Jeff Mickey <jeff@archlinux.org>

pkgname=liquidwar
pkgver=5.6.4
pkgrel=1
pkgdesc="Liquid War is a unique multiplayer wargame."
arch=(i686 x86_64)
depends=('allegro')
source=(http://www.ufoot.org/download/$pkgname/v5/$pkgver/$pkgname-$pkgver.tar.gz)
url="http://www.ufoot.org/liquidwar/"
license=(GPL)

build()
{
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-doc-txt --disable-doc-html \
    --disable-doc-info --disable-doc-ps --disable-doc-pdf --disable-doc-php3
  make GAMEDIR=/usr/bin DATADIR=/usr/share/$pkgname || return 1
  make DESTDIR=$startdir/pkg DATADIR=/usr/share/$pkgname install
  rm ${startdir}/pkg/usr/bin/*
  cp ${startdir}/pkg/usr/games/* ${startdir}/pkg/usr/bin/
  rm -r ${startdir}/pkg/usr/games
}
md5sums=('6917dd1026e6685404ffbd086f8ba374')
sha1sums=('a3006c4da9517c3af3b7bf165b2c86fa369a71c6')
