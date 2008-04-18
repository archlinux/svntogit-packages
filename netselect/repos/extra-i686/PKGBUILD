# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=netselect
pkgver=0.3
pkgrel=1
pkgdesc="An ultrafast intelligent parallelizing binary-search implementation of ping"
source=(http://www.worldvisions.ca/~apenwarr/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://www.worldvisions.ca/~apenwarr/netselect/index.html"
build() {
cd $startdir/src/$pkgname
sed -i -e 's#-\o root\ -g\ root##g' Makefile
make || return 1
mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/man/man8
make BINDEST=$startdir/pkg/usr/bin MANDEST=$startdir/pkg/usr/man/man8 install
}
