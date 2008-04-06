# $Id: PKGBUILD,v 1.3 2003/11/06 08:27:09 dorphell Exp $
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xpenguins
pkgver=2.2
pkgrel=1
pkgdesc="Ever wanted cute little penguins walking along the tops of your windows?"
depends=('imlib')
source=(http://xpenguins.seul.org/$pkgname-$pkgver.tar.gz)
url="http://xpenguins.seul.org"
build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
