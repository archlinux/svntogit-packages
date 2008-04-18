# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=pdns-mysql
pkgver=2.9.20
pkgrel=2
pkgdesc="MySQL backend for PowerDNS"
arch=(i686 x86_64)
url="http://www.powerdns.com"
license=(GPL)
depends=("pdns=${pkgver}" 'libmysqlclient>=5.0.27')
source=(http://downloads.powerdns.com/releases/pdns-${pkgver}.tar.gz)
md5sums=('33b20ef1b767f93297101f2aa09e99ed')

build() {
  cd ${startdir}/src/pdns-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--libdir=/usr/lib/powerdns \
	--with-modules="" \
	--with-dynmodules="gmysql"
  cd modules/gmysqlbackend
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm ${startdir}/pkg/usr/lib/powerdns/*.{,l}a
}
