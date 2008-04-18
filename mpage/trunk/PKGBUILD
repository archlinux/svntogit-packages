# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mpage
pkgver=2.5.4
pkgrel=2
pkgdesc="Useful for laying out several pages on a single sheet of paper"
depends=('glibc')
source=(http://www.mesa.nl/pub/$pkgname/$pkgname-$pkgver.tgz
mpage.tmpfile.patch mpage.gcc4.patch)
url="http://www.mesa.nl/pub/mpage/"
md5sums=('c14d58e24e7fdebe0c9eeb57ef1895f4' '1a3b324daf8387ad962917e44b22d6e7'\
         '0cd2f41147ee045b660462bc400f596a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../mpage.tmpfile.patch
  patch -Np1 -i ../mpage.gcc4.patch
  /usr/bin/make LIBDIR=/usr/lib || return 1
  /usr/bin/make PREFIX=$startdir/pkg/usr MANDIR=$startdir/pkg/usr/man/man1 \
    LIBDIR=$startdir/pkg/usr/lib BINDIR=$startdir/pkg/usr/bin install
}
# vim: ts=2 sw=2 et ft=sh
