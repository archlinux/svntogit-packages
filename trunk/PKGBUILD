# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: Georg Grabler <ggrabler@gmail.com>

pkgname=ktorrent
pkgver=2.2.5
pkgrel=1
pkgdesc="A BitTorrent program for KDE"
arch=('i686' 'x86_64')
url="http://ktorrent.org"
license=('GPL')
depends=('kdelibs' 'gmp')
makedepends=('autoconf' 'perl')
source=(http://ktorrent.org/downloads/$pkgver/${pkgname}-${pkgver}.tar.bz2)
md5sums=('070e84112b8dd146c1ad403c5403f076')
options=('libtool') # needs .la files for plugins

build() {
    export MAKEFLAGS="-j1"
    cd $startdir/src/$pkgname-$pkgver

    # Build!
    make -f admin/Makefile.common
    ./configure --prefix=/opt/kde
    make || return 1
    make DESTDIR=$startdir/pkg install
}

