# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libvisual-bmp
provides=('bmp-libvisual')
pkgver=0.2.0
pkgrel=2
pkgdesc="bmp plugin for libvisual"
url="http://libvisual.sourceforge.net/v2/"
depends=('bmp' 'libvisual' 'libvisual-plugins' 'sdl')
groups=('bmp-plugins' 'bmp-visualization-plugins')
source=(http://dl.sourceforge.net/sourceforge/libvisual/$pkgname-$pkgver.tar.gz)

build()
{
   cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
