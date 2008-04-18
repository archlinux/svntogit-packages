# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Dieter Verhelst <d.verhelst@burningfrog.be>

pkgname=gmencoder
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK2 gui for mencoder"
url="http://gmencoder.sourceforge.net"
backup=()
depends=('gtk2' 'mplayer' 'transcode' 'libgnomeui' 'libart-lgpl')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tgz )
md5sums=('2b011c02f9a9cf3d94554a02d052c938')

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr 
    make || return 1    
    make prefix=$startdir/pkg/usr install
                
}
