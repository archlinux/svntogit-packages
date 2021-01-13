# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgbase=audit
pkgname=('audit' 'python-audit')
pkgver=3.0
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
makedepends=('glibc' 'krb5' 'libcap-ng' 'libldap' 'swig' 'linux-headers' 'python')
license=('GPL')
options=('emptydirs')
source=(https://people.redhat.com/sgrubb/audit/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b82ec73c85a8ebb5108b526673d6fe08cbe0b51376788f3ea6ed5747c4612158462893e719496dffbd723f833f84383a2d1d55fd78a3ed985ecfd19545060c88')
b2sums=('f9c94f7163522068f5f37163a242cb913acc87b5465f7f8550fad27ac1dc673fd7a98e208bd5e6fb136eac1fdadd659e599e7722426937481bbf8c66d86a1617')

prepare() {
  cd ${pkgbase}-${pkgver}
  sed 's|/var/run/auditd.pid|/run/auditd.pid|' -i init.d/auditd.service
}

build() {
  cd ${pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/audit \
    --enable-gssapi-krb5=yes \
    --enable-systemd=yes \
    --with-libcap-ng=yes
  make
  [ -n "${SOURCE_DATE_EPOCH}" ] && touch -h -d @$SOURCE_DATE_EPOCH bindings/swig/python/audit.py
}

package_audit() {
  depends=('glibc' 'krb5' 'libcap-ng')
  provides=('libaudit.so' 'libauparse.so')
  backup=(
    etc/libaudit.conf
    etc/audit/audit-stop.rules
    etc/audit/auditd.conf
    etc/audit/audisp-remote.conf
    etc/audit/zos-remote.conf
    etc/audit/plugins.d/af_unix.conf
    etc/audit/plugins.d/au-remote.conf
    etc/audit/plugins.d/audispd-zos-remote.conf
    etc/audit/plugins.d/syslog.conf
  )

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" INSTALL='install -p' install

  cd "${pkgdir}"
  install -d -m 0700 var/log/audit
  rm -rf etc/rc.d \
    etc/sysconfig \
    usr/lib/audit \
    usr/lib/python*

  sed -ri 's|/sbin|/usr/bin|' \
    etc/audit/*.conf \
    etc/audit/plugins.d/*.conf \
    usr/lib/systemd/system/auditd.service

  chmod 644 usr/lib/systemd/system/auditd.service
}

package_python-audit() {
  depends=('python' 'audit')
  pkgdesc+=' (python bindings)'
  cd ${pkgbase}-${pkgver}
  make -C bindings DESTDIR="${pkgdir}" INSTALL='install -p' install
}

# vim: ts=2 sw=2 et:
