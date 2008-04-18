# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
pkgname=php-suhosin
pkgver=0.9.23
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Suhosin is an advanced protection system for PHP installations.'
url='http://www.hardened-php.net/suhosin/'
license='PHP'
source=("http://download.suhosin.org/suhosin-${pkgver}.tgz")
depends=('php')
install=php-suhosin.install
conflicts=('php-suhosin-extension')
replaces=('php-suhosin-extension')
backup=('etc/php/conf.d/suhosin.ini')
md5sums=('99fde256a662a72a2e2f130a42a90dba')

build() {
	cd $startdir/src/suhosin-$pkgver
	phpize || return 1
	./configure --prefix=/usr --enable-suhosin || return 1
	make || return 1
	make INSTALL_ROOT=${startdir}/pkg install || return 1
	# disable by default
	sed -i "s|extension = suhosin.so|;extension=suhosin.so|g" suhosin.ini
	install -D -m644 suhosin.ini ${startdir}/pkg/etc/php/conf.d/suhosin.ini
}
