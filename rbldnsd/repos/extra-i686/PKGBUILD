# $Id$
# Contributor: Dale Blount <dale@archlinux.org>
# Maintainer: Dale Blount <dale@archlinux.org>
pkgname=rbldnsd
pkgver=0.996
pkgrel=1
pkgdesc="Small and fast DNS daemon which is especially made to serve DNSBL zones"
arch=(i686 x86_64)
depends=('zlib')
backup=()
install="$pkgname.install"
url="http://www.corpit.ru/mjt/rbldnsd.html"
source=(http://www.corpit.ru/mjt/$pkgname/${pkgname}_${pkgver}.tar.gz)
md5sums=('adba618d40a724a4d07a9b176d86b645')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure || return 1
	make || return 1
	mkdir -p $startdir/pkg/var/lib/rbldns/logs
	chown 59:59 $startdir/pkg/var/lib/rbldns || return 1
	chown 58:58 $startdir/pkg/var/lib/rbldns/logs || return 1
	chmod 0711 -R $startdir/pkg/var/lib/rbldns
	install -D -m 0755 rbldnsd $startdir/pkg/usr/bin/rbldnsd || return 1
}
