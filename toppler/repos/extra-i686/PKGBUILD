# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Updates By: Helder Correia <helder.correia@netcabo.pt>

pkgname=toppler
pkgver=1.1.3
pkgrel=1
pkgdesc="Tower Toppler (aka Nebulous) is the reimplementation of an old 'jump and run' game"
arch=(i686 x86_64)
license=('GPL')
depends=('sdl_mixer' 'zlib')
url="http://toppler.sourceforge.net/"
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
toppler.desktop)
md5sums=('15ee44094e6a4e2a4f5f9b661f3fb617'
         'cd1559947da1a679e38d610b52441a10')

build()
{
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr --localstatedir=/var/games
    make || return 1
    make DESTDIR=$startdir/pkg install

    #install -Dm644 $startdir/src/$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop.kp
}
