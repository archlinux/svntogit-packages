# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgbase=audit
pkgname=('audit' 'python-audit')
pkgver=2.8.5
pkgrel=9
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
makedepends=('krb5' 'libcap-ng' 'libldap' 'swig' 'linux-headers' 'python')
license=('GPL')
options=('emptydirs')
source=(${pkgbase}-${pkgver}.tar.gz::https://people.redhat.com/sgrubb/audit/${pkgbase}-${pkgver}.tar.gz
        gcc10.patch)
sha512sums=('7d416aaa21c1a167f8e911ca82aecbaba804424f3243f505066c43ecc4a62a34feb2c27555e99d3268608404793dccca0f828c63670e3aa816016fb493f8174a'
            '78e32c05b6896d37bacf0938954fbce7486a528dabd55421f1715438fe489171f9157059050abdcb3f673258aa28b4a11f643ddb7824f3499a195dbbe634f101')

prepare() {
  cd ${pkgbase}-${pkgver}
  sed 's|/var/run/auditd.pid|/run/auditd.pid|' -i init.d/auditd.service

  # https://github.com/linux-audit/audit-userspace/issues/123
  patch -Np1 -i ../gcc10.patch
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
  depends=('krb5' 'libcap-ng')
  provides=('libaudit.so' 'libauparse.so')
  backup=(
    etc/libaudit.conf
    etc/audit/audit-stop.rules
    etc/audit/auditd.conf
    etc/audisp/audispd.conf
    etc/audisp/audisp-remote.conf
    etc/audisp/zos-remote.conf
    etc/audisp/plugins.d/af_unix.conf
    etc/audisp/plugins.d/audispd-zos-remote.conf
    etc/audisp/plugins.d/au-remote.conf
    etc/audisp/plugins.d/syslog.conf
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
    etc/audisp/plugins.d/*.conf \
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
