# $Id$
# Contributor: Markus Meissner <markus@meissna.de>
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=nvclock
pkgver=0.8b3
pkgrel=1
pkgdesc="A small utility which allows users to overclock NVIDIA based video cards"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
source=(http://www.linuxhardware.org/$pkgname/${pkgname}${pkgver}.tar.gz)
url="http://www.linuxhardware.org/nvclock/"
md5sums=('a49772deaa414898efc51c5e7e3660a2')
options=('!makeflags')

build(){
    cd $startdir/src/$pkgname$pkgver
    # --mandir isn't supported
    sed -i "s:${prefix}/man:${prefix}/share/man:" $startdir/src/$pkgname$pkgver/Makefile.in
    ./configure --prefix=$startdir/pkg/usr
    make || return 1
    mkdir -p $startdir/pkg/usr/bin
    make install
}
