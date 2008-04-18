# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=httptunnel
pkgver=3.3
pkgrel=1
pkgdesc="httptunnel creates a bidirectional virtual data connection tunnelled in HTTP requests"
source=(http://www.nocrew.org/software/httptunnel/$pkgname-$pkgver.tar.gz)
url="http://www.nocrew.org/software/httptunnel"
build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
