# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=net-snmp
pkgver=5.4.1
pkgrel=4
pkgdesc="A suite of applications used to implement SNMP v1, SNMP v2c and SNMP v3 using both IPv4 and IPv6"
arch=('i686' 'x86_64')
url="http://www.net-snmp.org/"
license=('custom')
depends=('openssl' 'tcp_wrappers')
provides=('ucd-snmp')
options=('!libtool' '!makeflags' '!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz \
	snmpd.rc)
md5sums=('6c974df7a5a5b1579f72115e6b045bda' '9f0d13676ba1fae1eb7eb178edd85b43')
sha1sums=('ac5ba033c10d53d3057415121f8c4936c643c208' '2c679b564a2c319d9ce2714a9776aa0e6d89c60a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
 
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man \
    --enable-ucd-snmp-compatibility --with-libwrap \
    --with-default-snmp-version="3" --with-sys-contact="root@localhost" \
    --with-sys-location="Unknown" --with-logfile="/var/log/snmpd.log" \
    --with-mib-modules="host misc/ipfwacc ucd-snmp/diskio tunnel ucd-snmp/dlmod" \
    --with-persistent-directory="/var/net-snmp" 

  make || return 1
  make DESTDIR=${startdir}/pkg INSTALL_PREFIX=${startdir}/pkg INSTALLDIRS=vendor install
  install -D -m755 ${startdir}/src/snmpd.rc ${startdir}/pkg/etc/rc.d/snmpd || return 1
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING

  # remove perllocal.pod and .packlist
  find ${startdir}/pkg -name perllocal.pod -delete
  find ${startdir}/pkg -name .packlist -delete
}
