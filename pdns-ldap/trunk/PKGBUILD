# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=pdns-ldap
pkgver=2.9.20
pkgrel=2
pkgdesc="LDAP backend for pdns"
arch=(i686 x86_64)
url="http://www.powerdns.com"
license=(GPL)
depends=("pdns=${pkgver}" 'libldap')
source=(http://downloads.powerdns.com/releases/pdns-${pkgver}.tar.gz
	fix-wildcardlookups-ldapbackend.patch)
md5sums=('33b20ef1b767f93297101f2aa09e99ed' 'cce810207d37e9c099b790f8fe9b751a')

build() {
  cd ${startdir}/src/pdns-${pkgver}
  patch -Np1 -i ${startdir}/src/fix-wildcardlookups-ldapbackend.patch || return 1
  ./configure --prefix=/usr \
	--sysconfdir=/etc/powerdns \
	--libexecdir=/usr/lib \
	--libdir=/usr/lib/powerdns \
	--with-modules="" \
	--with-dynmodules="ldap"
  cd modules/ldapbackend
  make DEFS+=-DLDAP_DEPRECATED || return 1
  make DESTDIR=${startdir}/pkg install
  rm ${startdir}/pkg/usr/lib/powerdns/*.{,l}a
}
