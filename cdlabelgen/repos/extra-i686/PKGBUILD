# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=cdlabelgen
pkgver=4.0.0
pkgrel=1
pkgdesc="Generates frontcards and traycards for CDs."
arch=(i686 x86_64)
install=
source=(http://www.aczoom.com/pub/tools/$pkgname-$pkgver.tgz)
url="http://www.aczoom.com/tools/cdinsert/"
depends=('perl')
md5sums=('0b8225fd914b5c7aa1d3e616b1c8accc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /bin/mkdir -p $startdir/pkg/usr/man/man1
  /usr/bin/make BASE_DIR=$startdir/pkg/usr \
                MAN_DIR=$startdir/pkg/usr/man install
}
# vim: ts=2 sw=2 et ft=sh
