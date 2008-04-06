# $Id: PKGBUILD,v 1.1 2007/12/07 20:06:17 tpowa Exp $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=indilib
pkgver=0.5
pkgrel=1
pkgdesc="INDI is an instrument neutral distributed interface control protocol that aims to provide backend driver support and automation for a wide range of Astronomical devices (telescopes, focusers, CCDs..etc)."
url="http://indi.sourceforge.net/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libusb' 'zlib')
makedepends=('pkgconfig')
source=(http://belnet.dl.sourceforge.net/sourceforge/indi/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
        cd $startdir/src/indi
         ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('1b370b2aad7c6aa79faccbec20b30278')
