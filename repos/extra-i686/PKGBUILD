# $Id$
# Maintainer: simo <simo@archlinux.org> 
# Contributor: Manolis Tzanidakis
#

pkgname=compface
pkgver=1.5.2
pkgrel=1
pkgdesc="Utils & libs to convert from/to X-Face format."
arch=(i686 x86_64)
url="http://ftp.xemacs.org/pub/xemacs/aux/"
depends=('glibc')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('62f4f79c0861ad292ba3cf77b4c48319')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p /$startdir/pkg/usr/{man/man{1,3},bin,include,lib}
  make prefix=$startdir/pkg/usr install
}
# vim: ts=2 sw=2 et ft=sh
