# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=qiv
pkgver=2.1pre12
pkgrel=1.1
pkgdesc="Quick Image Viewer (qiv) is a very small and fast GDK/Imlib image viewer"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('imlib' 'libxinerama')
makedepends=('pkgconfig')
source=(http://www.klografx.net/$pkgname/download/$pkgname-2.1-pre12.tgz)
url="http://www.klografx.net/qiv/"
md5sums=('80ba1e2da5115a3cc3a6f7e19cb620d8')

build() {
	cd $startdir/src/$pkgname-2.1-pre12
	make || return 1
	install -D -m 0755 qiv $startdir/pkg/usr/bin/qiv
	install -D -m 0644 qiv.1 $startdir/pkg/usr/man/man1/qiv.1
}
