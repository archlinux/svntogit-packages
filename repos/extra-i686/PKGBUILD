# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=recode
pkgver=3.6
pkgrel=2
pkgdesc="Converts files between various character sets and usages"
depends=('glibc')
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://www.gnu.org/software/recode/recode.html"
md5sums=('be3f40ad2e93dae5cd5f628264bf1877')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
