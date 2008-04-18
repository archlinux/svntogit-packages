# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=cd-discid
pkgver=0.9
pkgrel=1
pkgdesc="cd-discid is a backend utility to get CDDB discid information from a CD-ROM disc."
depends=('glibc')
source=(http://lly.org/~rcw/$pkgname/$pkgname\_$pkgver.orig.tar.gz)
url="http://lly.org/~rcw/cd-discid/"

build() {
	cd $startdir/src/$pkgname-$pkgver
	cc $CFLAGS $pkgname.c -o $pkgname
	install -Dm 0755 $pkgname $startdir/pkg/usr/bin/$pkgname
	install -Dm 0644 $pkgname.1 $startdir/pkg/usr/man/man1/$pkgname.1
}
