# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=nessus-core
pkgver=2.2.9
pkgrel=1
pkgdesc='The nessus core'
arch=(i686 x86_64)
url="http://www.nessus.org"
backup=()
source=(http://ftp.gwdg.de/pub/linux/misc/nessus/nessus-${pkgver}/src/${pkgname}-${pkgver}.tar.gz
	nessusd)
depends=("libnasl>=${pkgver}" 'gtk2')
md5sums=('c3f9db836d3b866b4a9395ee833638be' '03ab960ae42b0dadebd0973d9a191048')

build()
{
	export MAKEFLAGS="-j1"
	cd ${startdir}/src/${pkgname}
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make || return 1
	make install DESTDIR=${startdir}/pkg
	mkdir -p ${startdir}/pkg/etc/rc.d
	install -m755 ${startdir}/src/nessusd ${startdir}/pkg/etc/rc.d/
	rm ${startdir}/pkg/usr/include/nessus/includes.h
}
