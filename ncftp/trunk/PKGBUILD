# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=ncftp
pkgver=3.2.1
pkgrel=1
pkgdesc="A set of free application programs implementing FTP"
arch=(i686 x86_64)
depends=('ncurses')
source=(ftp://ftp.ncftp.com/ncftp/$pkgname-$pkgver-src.tar.bz2)
url="http://www.ncftp.com/"
md5sums=('d82cdfe0d5448172c03b434607414fb8')
license=('custom')

build() {
  cd $startdir/src/$pkgname-$pkgver || return 1
  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
  make prefix=$startdir/pkg/usr mandir=$startdir/pkg/usr/man install || return 1
  
  # Install license
  install -D doc/LICENSE.txt \
  	$startdir/pkg/usr/share/licenses/ncftp/LICENSE.txt || return 1
}
