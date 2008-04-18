# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=libnasl
pkgver=2.2.9
pkgrel=1
pkgdesc='A remote security scanner for nessus'
arch=(i686 x86_64)
url="http://www.nessus.org"
source=(http://ftp.gwdg.de/pub/linux/misc/nessus/nessus-${pkgver}/src/${pkgname}-${pkgver}.tar.gz)
depends=("nessus-libraries>=${pkgver}" 'openssl>=0.9.8b')
options=(NOLIBTOOL)
md5sums=('fa0393e940253a95437d38edd6ff1844')

build()
{
  export MAKEFLAGS="-j1"
  cd ${startdir}/src/${pkgname}
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
  make || return 1
  make install DESTDIR=${startdir}/pkg
}
