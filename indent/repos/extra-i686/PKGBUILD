# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Herb Rose (hrose56@yahoo.com)
pkgname=indent
pkgver=2.2.9
pkgrel=1
pkgdesc="The GNU Pretty-printer"
url="http://mysite.freeserve.com/indent/beautify.html"
depends=('glibc')
source=(http://mysite.freeserve.com/$pkgname/${pkgname}_$pkgver.tar.gz)
md5sums=('dcdbb163bef928306dee2a0cfc581c89')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
