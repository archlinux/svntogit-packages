# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libvisual
pkgver=0.4.0
pkgrel=1
pkgdesc="abstraction library that comes between applications and audio visualisation plugins"
url="http://localhost.nl/~synap/libvisual/"
depends=('glibc')
source=("http://puzzle.dl.sourceforge.net/sourceforge/libvisual/libvisual-$pkgver.tar.gz")
arch=("i686" "x86_64")

build()
{
   cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
	# libtoolslay
	find $startdir/pkg -name '*.la' -exec rm {} \;
}

