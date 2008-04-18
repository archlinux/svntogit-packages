# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=pdns
pkgver=2.9.20
pkgrel=2
pkgdesc="A modern, advanced and high performance authoritative-only nameserver"
arch=(i686 x86_64)
url="http://www.powerdns.com"
license="GPL"
depends=('gcc' 'zlib')
makedepends=('boost')
install=pdns.install
backup=('etc/powerdns/pdns.conf')
source=(http://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.gz
	fix-ipv6-handling.patch
	fix-memory-corruption.patch
	fix-unaligned-access.patch
	fix-wrong-ttl-for-soa-during-axfr.patch
        pdns.rc
        pdns.conf)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/fix-ipv6-handling.patch || return 1
  patch -Np1 -i ${startdir}/src/fix-memory-corruption.patch || return 1
  patch -Np1 -i ${startdir}/src/fix-unaligned-access.patch || return 1
  patch -Np1 -i ${startdir}/src/fix-wrong-ttl-for-soa-during-axfr.patch || return 1
  ./configure --prefix=/usr \
	--sysconfdir=/etc/powerdns \
	--libexecdir=/usr/lib \
	--libdir=/usr/lib/powerdns \
	--infodir=/usr/info \
	--mandir=/usr/man \
	--with-modules="" \
	--with-dynmodules="" \
	--disable-recursor
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/etc/rc.d
  mkdir -p ${startdir}/pkg/etc/powerdns
  rm ${startdir}/pkg/etc/powerdns/pdns.conf-dist
  install -m644 ${startdir}/src/pdns.conf ${startdir}/pkg/etc/powerdns/
  install -m755 ${startdir}/src/pdns.rc ${startdir}/pkg/etc/rc.d/pdns
}
