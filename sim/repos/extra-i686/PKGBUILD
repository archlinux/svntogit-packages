# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=sim
pkgver=0.9.4.3
pkgrel=1
depends=('kdelibs' 'libxss' 'libtool' )
makedepends=('zip')
pkgdesc="SIM (Simple Instant Messenger) - plugins-based instant messenger with support various protocols"
arch=(i686 x86_64)
source=(http://download.berlios.de/sim-im/$pkgname-$pkgver.tar.gz)
url="http://sim-im.org/"
md5sums=('b9c5d0fe73b22642ac7695c23e7b26c1')

build()        {
	export MAKEFLAGS="-j1"
	cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/opt/kde --disable-debug 
        make || return 1
        make DESTDIR=$startdir/pkg install
	#to avoid conflict with kdenetwork
	rm $startdir/pkg/opt/kde/share/mimelnk/application/x-icq.desktop
}
