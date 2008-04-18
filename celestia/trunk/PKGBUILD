# $Id$
# Contributor : Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: damir <damir@archlinux.org>

pkgname=celestia
pkgver=1.5.0
pkgrel=1
pkgdesc="Real-time space simulation"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.shatters.net/celestia/"
depends=('gtk2' 'libtheora' 'lua' 'gtkglext' 'glut' 'libxmu' 'mesa')
source=(http://puzzle.dl.sourceforge.net/sourceforge/celestia/$pkgname-$pkgver.tar.gz) 

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr \
                --with-lua=/usr \
		--datadir=/usr/share \
                --with-gtk 
    # build 
    make || return 1
    make DESTDIR=$startdir/pkg install
}

md5sums=('156bc1080d27906122945a20d84d4a82')
