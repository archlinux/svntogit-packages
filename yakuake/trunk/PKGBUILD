# $Id$
# Maintainer: James Rayner <iphitus@gmail.com>
#Contributor: leeghoofd <abcdefg@solcon.nl>

pkgname=yakuake
pkgver=2.8.1
pkgrel=1
pkgdesc="A KDE konsole application with the look and feel of that in the Quake engine"
arch=(i686 x86_64)
url="http://yakuake.uv.ro/"
license=("GPL")
depends=('kdelibs')
source=(http://download.berlios.de/yakuake/yakuake-${pkgver}.tar.bz2)


build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/opt/kde
	make || return 1
	make DESTDIR=$startdir/pkg install
}


md5sums=('b638dd6ec3d7ca50ed28cbe5f15cc56b')
