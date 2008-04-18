# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=gift-gnutella
pkgver=0.0.11
pkgrel=1
pkgdesc="GiFT's Gnutella plugin."
arch=(i686 x86_64)
depends=('gift' 'zlib')
source=(http://heanet.dl.sourceforge.net/sourceforge/gift/$pkgname-$pkgver.tar.bz2)
url="http://gift.sourceforge.net"
md5sums=('279c7dc0121b3b7e209b09c98d10f17f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  touch NEWS AUTHORS
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/usr/share/giFT/Gnutella
  cp $startdir/src/$pkgname-$pkgver/data/Gnutella.conf $startdir/pkg/usr/share/giFT/Gnutella
  cp $startdir/src/$pkgname-$pkgver/data/hostiles.txt $startdir/pkg/usr/share/giFT/Gnutella
}
