# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: itlain <esears@fluxback.net>

pkgname=viewglob
pkgver=2.0.4
pkgrel=1
pkgdesc="viewglob is a utility designed to complement the Unix shell in a grapical enviroment"
arch=(i686 x86_64)
url="http://viewglob.sourceforge.net/index.html"
depends=('gtk2' 'bash' 'libsm')
source=(http://switch.dl.sourceforge.net/sourceforge/viewglob/viewglob-$pkgver.tar.gz)
#source=(http://dl.sourceforge.net/sourceforge/viewglob/$pkgname-$pkgver.tar.gz)

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install
}
