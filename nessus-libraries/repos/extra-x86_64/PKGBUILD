# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=nessus-libraries
pkgver=2.2.9
pkgrel=1
pkgdesc='The nessus libraries'
arch=(i686 x86_64)
url="http://www.nessus.org"
source=(http://ftp.gwdg.de/pub/linux/misc/nessus/nessus-${pkgver}/src/${pkgname}-${pkgver}.tar.gz)
depends=('glibc' 'bash')
options=(NOLIBTOOL)
md5sums=('28156ff38208a1f59b333a8c2a23d8f6')

build()
{
	cd ${startdir}/src/${pkgname}
	./configure --prefix=/usr || return 1
	make || return 1
	make install DESTDIR=${startdir}/pkg
}
