# $Id: PKGBUILD,v 1.1 2007/12/07 12:02:13 tpowa Exp $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libvncserver
pkgver=0.9.1
pkgrel=1
pkgdesc="The vnc library"
url="http://libvncserver.sourceforge.net/"
license="GPL"
arch=('i686' 'x86_64')
depends=('libjpeg' 'zlib')
source=(http://heanet.dl.sourceforge.net/sourceforge/libvncserver/LibVNCServer-$pkgver.tar.gz)
options=(!libtool)

build() {
        cd $startdir/src/LibVNCServer-$pkgver
         ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('aa00efc3dabde82fde9509bfbab0aba4')
