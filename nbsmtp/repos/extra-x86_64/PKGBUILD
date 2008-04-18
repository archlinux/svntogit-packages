# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
#Contributed by Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=nbsmtp
pkgver=1.00
pkgrel=1
pkgdesc="No-Brainer SMTP client suitable to run in chroot jails, embeded systems, laptops, and workstations"
arch=(i686 x86_64)
depends=('openssl')
source=(http://www.gentoo-es.org/~ferdy/$pkgname-$pkgver.tar.bz2 build.patch)
url="http://nbsmtp.ferdyx.org/"

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -Np0 -i ../build.patch || return 1
	./configure --prefix=/usr --enable-ssl
	make || return 1
	make prefix=$startdir/pkg/usr install
}
