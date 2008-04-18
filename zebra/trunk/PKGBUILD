# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=zebra
pkgver=0.95a
pkgrel=2
pkgdesc="Manages IPv4 and IPv6 routing protocols"
arch=(i686 x86_64)
depends=('glibc')
source=(ftp://ftp.zebra.org/pub/zebra/$pkgname-$pkgver.tar.gz)
url="http://www.zebra.org/"
license=('GPL')
md5sums=('9b8fec2d4f910334e50167414fcf193b')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc/zebra
	make || return 1
	make prefix=$startdir/pkg/usr sysconfdir=$startdir/pkg/etc/zebra install
}
