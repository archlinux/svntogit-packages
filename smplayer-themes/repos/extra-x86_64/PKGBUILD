# $Id$
# Maintainer: Varun Acharya <varun@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
 
pkgname=smplayer-themes
pkgver=0.1.14
pkgrel=1
pkgdesc="Themes for smplayer"
arch=('i686' 'x86_64')
url="http://smplayer.sourceforge.net/" 
license=('GPL')
depends=('smplayer>=0.4.19')
source=(http://downloads.sourceforge.net/sourceforge/smplayer/smplayer-themes-$pkgver.tar.bz2)
md5sums=('df643b9cc09bc5f499ef00c9aa01ba33')

build() { 
     cd $startdir/src/$pkgname-$pkgver
     make PREFIX=$startdir/pkg/usr CONF_PREFIX= || return 1 
     make PREFIX=$startdir/pkg/usr install
}
