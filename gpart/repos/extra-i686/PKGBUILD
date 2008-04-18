# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gpart
pkgver=0.1h
pkgrel=2
pkgdesc="Gpart is a tool which tries to guess the primary partition table of a PC-type hard disk in case the primary partition table in sector 0 is damaged"
url="http://www.stud.uni-hannover.de/user/76201/gpart/"
source=(http://www.stud.uni-hannover.de/user/76201/gpart/$pkgname-$pkgver.tar.gz)
md5sums=('ee3a2d2dde70bcf404eb354b3d1ee6d4')

build() {
	cd $startdir/src/$pkgname-$pkgver
	make || return 1
	make prefix=$startdir/pkg/usr install
}
