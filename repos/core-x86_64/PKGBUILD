# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgbase=audit
pkgname=('audit' 'python-audit')
pkgver=3.0.1
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
makedepends=('glibc' 'krb5' 'libcap-ng' 'libldap' 'swig' 'linux-headers' 'python')
license=('GPL')
options=('emptydirs')
source=(https://people.redhat.com/sgrubb/audit/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ad2897c9f539681f0f65b08cd0e650c528957fd4799755c2bcc47f869e04272aad31684c46847124d7b42dde243a16ba2754936890189610814c7007c0381d8c')
b2sums=('f29687ebc76f4eb88184cce1a3da0b8ca4464b2f81f56d71048ac4a64a713f33d6964e46e78b73c72b6ac2495f80114866773b3b86753c1d0dead25df73f7c43')

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
