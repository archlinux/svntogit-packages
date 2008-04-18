# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=di
pkgver=4.11
pkgrel=1
pkgdesc="di is a disk information utility, displaying everything (and more) that your df command does"
arch=('i686' 'x86_64')
url="http://www.gentoo.com/di/"
license=('custom')
depends=('glibc')
source=(http://www.gentoo.com/di/$pkgname-$pkgver.tar.gz)
md5sums=('d41461eb23dbe2adab9d074478240b7e')

build() {
	cd $startdir/src/$pkgname-$pkgver
	# ./configure --prefix=/usr
	make || return 1

	mkdir -p $startdir/pkg/usr/{bin,man/man1}
	install -m 755 di $startdir/pkg/usr/bin/di
	ln -s /usr/bin/di $startdir/pkg/usr/bin/mi
	install -m 644 di.1 $startdir/pkg/usr/man/man1/di.1
	install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
	install -D -m644 LICENSE.iffe $startdir/pkg/usr/share/licenses/$pkgname/LICENSE.iffe
}
