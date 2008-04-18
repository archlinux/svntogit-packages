# $Id$
# Maintainer: dale <dale@archlinux.org>

pkgname=vacation
pkgver=1.2.6.3
pkgrel=1
pkgdesc="an automatic mail-answering program"
arch=(i686 x86_64)
depends=(gdbm)
license=(GPL)
url="http://vacation.sourceforge.net/"
source=(http://superb-east.dl.sourceforge.net/sourceforge/vacation/$pkgname-$pkgver.tar.gz)
md5sums=('6260cc581da4e77718948a98d055ab7d')

build() {
	cd $startdir/src/$pkgname-$pkgver
        mkdir -p $startdir/pkg/usr/{bin,man/man1}
	make || return 1
	install -s -m 755 vacation     $startdir/pkg/usr/bin/vacation
	install -m 755 vaclook         $startdir/pkg/usr/bin/vaclook
	install -m 444 vacation.man    $startdir/pkg/usr/man/man1/vacation.1
	install -m 444 vaclook.man     $startdir/pkg/usr/man/man1/vaclook.1
}
