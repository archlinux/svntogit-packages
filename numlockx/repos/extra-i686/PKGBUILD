# $Id$
# Maintainer: Travis Willard <travisw@wmpub.ca> 
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=numlockx
pkgver=1.1
pkgrel=3
pkgdesc="Turns on the numlock key in X11"
arch=('i686' 'x86_64')
license=('custom')
url="http://ktown.kde.org/~seli/numlockx/"
depends=('libxtst')
source=(http://ktown.kde.org/~seli/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd $startdir/src/$pkgname-$pkgver

    # Install the custom license.
    install -D LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE

	export CFLAGS="$CFLAGS -I/usr/include/X11"
	./configure --prefix=/usr x_includes=/usr/include/X11 \
		x_libraries=/usr/lib
	make || return 1
	make prefix=$startdir/pkg/usr install
}

md5sums=('127d9dfbbbe6dbec62cc78db340f913c')
sha1sums=('5c48276839ae108e2fa6dc2293ebfd87d83e45fd')
