# $Id$
# Maintainer: Woody Gilk <woody@archlinux.org>
pkgname=libflashsupport
pkgver=9.0.21.78
pkgrel=2
pkgdesc="Macromedia flash plugin support lib (OSS SSL)"
url="http://www.macromedia.com/software/flashplayer/"
license="custom"
arch=('i686')
depends=('flashplugin' 'icu' 'openssl')
source=(http://www.kaourantin.net/flashplayer/flashsupport.c)
md5sums=('bb8a0de41ba18f9f1fcad7038cacb688')

build() {
	msg "Building libflashsupport"
	cd $startdir/src
	echo $CC $CFLAGS -shared -Wall -Werror -licuuc -lssl flashsupport.c -o libflashsupport.so
	$CC $CFLAGS -shared -Wall -Werror -licuuc -lssl flashsupport.c -o libflashsupport.so || return 1
	install -D -m755 libflashsupport.so $startdir/pkg/usr/lib/libflashsupport.so
}
