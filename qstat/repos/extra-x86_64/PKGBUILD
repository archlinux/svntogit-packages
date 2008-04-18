# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> with contributions from Andreas Schweitzer <sig11@gmx.net>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=qstat
pkgver=2.11
pkgrel=1
pkgdesc="Qstat is a command line utility that displays the status of internet game servers including Quake"
arch=(i686 x86_64)
depends=('glibc')
source=(http://dl.sourceforge.net/sourceforge/qstat/$pkgname-$pkgver.tar.gz)
url="http://www.qstat.org/"
md5sums=('26c09831660ef9049fe74b786b80d091')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make || return 1
	make DESTDIR=$startdir/pkg install
}
