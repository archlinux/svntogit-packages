# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=pdns-recursor
pkgver=3.0.1
pkgrel=1
pkgdesc="PowerDNS recursor"
url="http://www.powerdns.com"
license=(GPL)
depends=(gcc)
makedepends=(boost)
backup=('etc/powerdns/recursor.conf')
source=(http://downloads.powerdns.com/releases/${pkgname}-${pkgver}.tar.bz2
        pdns-recursor.rc
        recursor.conf)
md5sums=(367b2c091791dc7f49002a6d8fedf011 5b3aa3c8ed2edf55821af16cfb7ef252 
         a7eeacd49294419d188c4d2714999d10)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/etc/rc.d
  mkdir -p ${startdir}/pkg/etc/powerdns
  rm -f ${startdir}/pkg/etc/powerdns/recursor.conf-dist
  install -m644 ${startdir}/src/recursor.conf ${startdir}/pkg/etc/powerdns/
  install -m755 ${startdir}/src/pdns-recursor.rc ${startdir}/pkg/etc/rc.d/pdns-recursor
}
