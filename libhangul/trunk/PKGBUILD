# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libhangul
pkgver=0.0.7
kldpnumber=4487
pkgrel=1
pkgdesc="Common Input Library for Korean IMEngine"
url="http://kldp.net/projects/hangul/"
arch=("i686" "x86_64")
depends=('glibc')
license=("LGPL")
source=("http://kldp.net/frs/download.php/${kldpnumber}/${pkgname}-${pkgver}.tgz")
options=(!libtool)


build() {
	
	cd ${startdir}/src/${pkgname}-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install
}

md5sums=('b5808c07266cd03c828a32efb7424786')
