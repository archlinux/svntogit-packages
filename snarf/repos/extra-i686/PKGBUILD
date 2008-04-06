# $Id: PKGBUILD,v 1.8 2003/11/06 08:26:20 dorphell Exp $
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=snarf
pkgver=7.0
pkgrel=2
pkgdesc="Command-line URL retrieval tool (http/ftp/gopher)"
backup=()
depends=('glibc')
source=(http://www.xach.com/snarf/download/source/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
