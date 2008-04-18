# $Id$
# Maintainer: Varun Acharya <varun@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: shamrok <szamrok@gmail.com>
 
pkgname=smplayer
pkgver=0.6.0rc1
pkgrel=1
pkgdesc="A complete front-end for MPlayer" 
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/" 
license=('GPL')
depends=('qt' 'mplayer')
conflicts=('smplayer-qt4')
replaces=('smplayer-qt4')
provides=('smplayer-qt4')
source=(http://downloads.sourceforge.net/sourceforge/smplayer/$pkgname-$pkgver.tar.bz2) 
install=(smplayer.install)
md5sums=('f93f6a6840aed0d070c30d1931a62904')

build() { 
     cd $startdir/src/$pkgname-$pkgver

     make PREFIX=/usr || return 1 
     make PREFIX=$startdir/pkg/usr install     

     mkdir -p $startdir/pkg/usr/share/pixmaps
     ln -s /usr/share/icons/hicolor/64x64/apps/smplayer.png \
            $startdir/pkg/usr/share/pixmaps/
}

