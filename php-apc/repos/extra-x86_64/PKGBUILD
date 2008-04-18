# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
pkgname=php-apc
pkgver=3.0.18
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='APC is a free, open, and robust framework for caching and optimizing PHP intermediate code.'
url='http://pecl.php.net/package/APC'
depends=('php')
license="PHP"
source=("http://pecl.php.net/get/APC-${pkgver}.tgz" 'apc.ini')
install=php-apc.install
backup=('etc/php/conf.d/apc.ini')
md5sums=('491d63dfa35f9b6ff7421059aa448d4a' 'd97e651eb50b072f91e193d11a528d9b')

build() {
	cd $startdir/src/APC-$pkgver
	phpize || return 1
	./configure --prefix=/usr || return 1
	make || return 1
	make INSTALL_ROOT=${startdir}/pkg install || return 1
	install -D -m644 ../apc.ini ${startdir}/pkg/etc/php/conf.d/apc.ini
}
