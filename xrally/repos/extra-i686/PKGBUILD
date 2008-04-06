# $Id: PKGBUILD,v 1.3 2003/11/06 08:27:09 dorphell Exp $
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xrally
pkgver=1.1.1
pkgrel=1
pkgdesc="XRally is a clone of the Rally X arcade game"
depends=('cvs')
source=(http://unc.dl.sourceforge.net/$pkgname/$pkgname-1.1.tar.bz2)
url="http://www.linuxgames.com/xrally/"
build() {
cd $startdir/src/$pkgname
patch < $startdir/xrally-1.1.1.patch
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
