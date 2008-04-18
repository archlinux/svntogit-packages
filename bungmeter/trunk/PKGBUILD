# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: roberto <roberto@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=bungmeter
pkgver=2.0.1
pkgrel=1
pkgdesc="A fork of fnetload - a graphical network monitor designed to be small and lightweight."
url="http://freshmeat.net/projects/bungmeter/"
arch=(i686 x86_64)
depends=('gtk2')
replaces=('fnetload')

source=(http://grecni.com/bungmeter/$pkgname-$pkgver.tar.bz2)

build() {
    cd $startdir/src/$pkgname-$pkgver
    ./configure --prefix=/usr
    make || return 1
    make prefix=$startdir/pkg/usr install
}
