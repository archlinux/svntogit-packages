# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=bonnie++
pkgver=1.03b
pkgrel=1
pkgdesc="Bonnie++ is based on the Bonnie hard drive benchmark by Tim Bray"
arch=(i686 x86_64)
license=('GPL')
source=(http://www.coker.com.au/bonnie++/$pkgname-$pkgver.tgz)
depends=('gcc' 'perl')
url="http://www.coker.com.au/bonnie++/"
md5sums=('ee7a236c2a4d8a7075eb67d9254e6bd8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  /bin/sed -i "s:CFLAGS=-O2  -DNDEBUG \$(WFLAGS) \$(MORECFLAGS):CFLAGS=${CFLAGS}:" \
      Makefile
  make || return 1
  make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh

