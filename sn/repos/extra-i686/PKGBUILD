# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=sn
pkgver=0.3.8
pkgrel=1
pkgdesc="A small news system for small sites."
url="http://infa.abo.fi/~patrik/sn"
depends=('zlib' 'bash')
install="$pkgname.install"
source=($url/files/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i "s:-g -Wall -pedantic -O:${CFLAGS}:" Makefile
  make PREFIX=/usr || return 1
  mkdir -p $startdir/pkg/{usr/{man/man8,sbin},var/spool/news}
  make PREFIX=$startdir/pkg/usr install
  mknod -m 600 $startdir/pkg/var/spool/news/.fifo p
}
