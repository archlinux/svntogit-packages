# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=sharutils
pkgver=4.6.3
pkgrel=1
pkgdesc="GNU shar makes so-called shell archives out of many files"
arch=(i686 x86_64)
depends=('gettext')
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/REL-$pkgver/$pkgname-$pkgver.tar.gz)
url="http://www.gnu.org/software/sharutils/"
md5sums=('74127a560e59be6dfa8b59993eb0ca91')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-nls
  make || return 1
  make prefix=$startdir/pkg/usr install
}
