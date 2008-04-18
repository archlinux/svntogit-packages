# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=openldap-clients
pkgver=2.3.40
pkgrel=1
pkgdesc="LDAP Client utilities"
arch=(i686 x86_64)
license=('custom')
url="http://www.openldap.org/"
depends=("libldap>=${pkgver}")
source=(ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-${pkgver}.tgz)
options=('!makeflags')

build() {
  cd ${startdir}/src/openldap-${pkgver}
  ./configure --prefix=/usr \
              --libexecdir=/usr/sbin \
              --sysconfdir=/etc \
              --localstatedir=/var/lib/openldap \
              --enable-crypt --enable-dynamic \
              --with-threads --enable-wrappers \
	      --enable-spasswd --with-cyrus-sasl \
	      --disable-bdb --disable-hdb
  
  find . -name 'Makefile' -exec \
  	sed -e 's|$(LDAP_LIBDIR)/liblber/liblber.la|/usr/lib/liblber-2.3.so.0|g' \
	    -e 's|$(LDAP_LIBDIR)/libldap/libldap.la|/usr/lib/libldap-2.3.so.0|g' \
	    -e 's|$(LDAP_LIBDIR)/libldap_r/libldap_r.la|/usr/lib/libldap_r-2.3.so.0|g' \
	    -i {} \;

  cd include
  make || return 1

  cd ../libraries
  for dir in liblutil librewrite liblunicode; do
    pushd ${dir}
    make depend || return 1
    make || return 1
    popd
  done
  cd ../clients
  make depend || return 1
  make || return 1

  make DESTDIR=${startdir}/pkg install

  cd ../doc/man/man1
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
md5sums=('728e95d806a3d47d9686481d72e62072')
