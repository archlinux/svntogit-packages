# $Id$
# Maintainer: dale <dale@archlinux.org>
pkgname=host
pkgver=20070128
pkgrel=1
pkgdesc="Lightweight alternative to bind's host."
arch=(i686 x86_64)
url="http://www.weird.com/~woods/projects/host.html"
source=(ftp://ftp.weird.com/pub/local/$pkgname-$pkgver.tar.gz Build.patch)
md5sums=('35156dce6b0905d741e67f53d24ea15b' '0236c9708ac12c63838418b18729a891')
conflicts=('bind' 'dnsutils')

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch < $startdir/src/Build.patch || return 1
	sed -i "s%#PREFIX#%$startdir/pkg/usr%g" Makefile 
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/man/man1
	make || return 1
	make install || return 1
}

