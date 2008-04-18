# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Dale Blount <archlinux@dale.us>

pkgname=fortune-mod
pkgver=1.99.1
pkgrel=3
pkgdesc="The Fortune Cookie Program from BSD games"
depends=('recode')
source=(http://www.redellipse.net/code/downloads/$pkgname-$pkgver.tar.gz)
url="http://www.redellipse.net/code/fortune"
force=y

build() {
  cd $startdir/src/$pkgname-$pkgver
  make REGEXDEFS='-DHAVE_REGEX_H -DPOSIX_REGEX -DHAVE_STDBOOL'  \
       COOKIEDIR=/usr/share/fortune  \
       LOCALDIR=/usr/local/share/fortune || return 1
  make COOKIEDIR=/usr/share/fortune fortune/fortune.man
  make FORTDIR=$startdir/pkg/usr/bin  \
       COOKIEDIR=$startdir/pkg/usr/share/fortune  \
       BINDIR=$startdir/pkg/usr/sbin  \
       BINMANDIR=$startdir/pkg/usr/man/man1  \
       FORTMANDIR=$startdir/pkg/usr/man/man6 install
  rm $startdir/pkg/usr/share/fortune/*.u8
  rm $startdir/pkg/usr/share/fortune/off/*.u8
}
