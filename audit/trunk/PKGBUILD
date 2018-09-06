# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer : Christian Rebischke <Chris.Rebischke@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: <kang@insecure.ws>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Connor Behan <connor.behan@gmail.com>
# Contributor: henning mueller <henning@orgizm.net>

pkgname=audit
pkgver=2.8.4
pkgrel=1
pkgdesc='Userspace components of the audit framework'
url='https://people.redhat.com/sgrubb/audit'
arch=('x86_64')
depends=('krb5' 'libcap-ng')
makedepends=('libldap' 'swig' 'linux-headers' 'python' 'python2')
license=('GPL')
options=('emptydirs')
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
source=(${pkgname}-${pkgver}.tar.gz::https://people.redhat.com/sgrubb/audit/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5795c565effab995cee447a2dc457ef6a6f15201fb185d7104992ac373a3cb5cfc865dd661c0896a895c96f452eff392d455064d0eead55cd7364d96e0d15c4a')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHON=/usr/bin/python2
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/audit \
    --enable-gssapi-krb5=yes \
    --enable-systemd=yes \
    --with-libcap-ng=yes
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  cd ${pkgdir}
  install -d var/log/audit
  rm -rf etc/rc.d etc/sysconfig usr/lib/audit

  sed -ri 's|/sbin|/usr/bin|' \
    etc/audit/*.conf \
    etc/audisp/plugins.d/*.conf \
    usr/lib/systemd/system/auditd.service

  chmod 644 usr/lib/systemd/system/auditd.service
}
