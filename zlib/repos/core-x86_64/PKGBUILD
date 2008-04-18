# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=zlib
pkgver=1.2.3
pkgrel=4
pkgdesc="A compression/decompression Library"
arch=(i686 x86_64)
license=('custom:zlib')
url="http://www.gzip.org/zlib"
groups=('base')
depends=('glibc')
source=(http://www.zlib.net/zlib-$pkgver.tar.gz)
md5sums=('debc62758716a169df9f62e6ab2bc634')

build() {
	cd "$startdir"/src/zlib-$pkgver

  	# Build the static library
	./configure --prefix=/usr
	make libz.a || return 1
	mv -v {,x}libz.a
	make clean

	# enable Position Independent Code for prelinking
	[ -n "$CFLAGS" ] && export CFLAGS="$CFLAGS -fPIC"
	# Build the shared library
	./configure --prefix=/usr --shared
	make || return 1

	# install
	make prefix="$startdir"/pkg/usr install
	cp -v xlibz.a "$startdir"/pkg/usr/lib/libz.a
	mkdir -pv "$startdir"/pkg/lib
	mv -v "$startdir"/pkg/usr/lib/libz.so.* "$startdir"/pkg/lib/
	chmod 644 "$startdir"/pkg/lib/*
	ln -svf ../../lib/libz.so.1 "$startdir"/pkg/usr/lib/libz.so

	# license, ripped out of the README file
	mkdir -p "$startdir/pkg/usr/share/licenses/$pkgname"
	grep -A 100 '^Copyright' README > "$startdir/pkg/usr/share/licenses/$pkgname/license.txt"
}
