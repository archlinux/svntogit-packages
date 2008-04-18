# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=nessus-plugins
pkgver=2.2.9
pkgrel=1
pkgdesc='The nessus plugins'
arch=(i686 x86_64)
url="http://www.nessus.org"
source=(http://ftp.gwdg.de/pub/linux/misc/nessus/nessus-${pkgver}/src/${pkgname}-GPL-${pkgver}.tar.gz)
depends=("nessus-core>=${pkgver}" "nessus-libraries>=${pkgver}" 'openssl>=0.9.8b')
md5sums=('2bac30f702c4a794a29660b8e9dd1077')

build(){
	cd ${startdir}/src/${pkgname}
	./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
	make || return 1
	make install DESTDIR=${startdir}/pkg
}
