# $Id$
# Maintainer: juergen <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=scsh
pkgver=0.6.7
pkgrel=1
pkgdesc="A Unix shell embedded in Scheme"
depends=('glibc' 'bash')
conflicts=('scheme48')
install=$pkgname.install
source=(ftp://ftp.scsh.net/pub/scsh/0.6/$pkgname-$pkgver.tar.gz)
md5sums=('69c88ca86a8aaaf0f87d253b99d339b5')
url="http://www.scsh.net/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=/usr install
	make DESTDIR=$startdir/pkg/ install
  /bin/rm -rf $startdir/pkg/usr/lib/scsh/doc
}
# vim: ts=2 sw=2 et ft=sh
