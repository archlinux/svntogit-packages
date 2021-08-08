# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgbase=audit
pkgname=('audit' 'python-audit')
pkgver=3.0.4
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
makedepends=('glibc' 'krb5' 'libcap-ng' 'libldap' 'swig' 'linux-headers' 'python')
license=('GPL')
options=('emptydirs')
source=(https://people.redhat.com/sgrubb/audit/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5bbfe24d0bb1c80a1478abd695d72fff447cfbca00abbed9892535ed45c4bef486fd22998a5491a0768c8bfa6e11ded22f67277473b795000bf9b10099bea423')
b2sums=('36293508e21a79fa0178d02416a95bdc6df1eec475758143f5d4fa7493206559f8bf556464beb8619f3edbbba944e15767fbc8e888c402423c8918b666006a72')

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
