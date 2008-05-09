# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=pdns-pgsql
pkgver=2.9.20
pkgrel=3
pkgdesc="PostgreSQL backend for PowerDNS"
arch=(i686 x86_64)
url="http://www.powerdns.com"
license=(GPL)
depends=("pdns=${pkgver}" 'postgresql-libs>=8.2.3')
source=(http://downloads.powerdns.com/releases/pdns-${pkgver}.tar.gz)
md5sums=('33b20ef1b767f93297101f2aa09e99ed')

build() {
  cd ${startdir}/src/pdns-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc/powerdns \
	--libexecdir=/usr/lib \
	--libdir=/usr/lib/powerdns \
	--infodir=/usr/info \
	--mandir=/usr/man \
	--with-modules="" \
	--with-dynmodules="gpgsql" \
	--with-pgsql-includes=/usr/include 
  cd modules/gpgsqlbackend
  make || return 1
  make DESTDIR=${startdir}/pkg install 
  rm ${startdir}/pkg/usr/lib/powerdns/*.{,l}a
}
