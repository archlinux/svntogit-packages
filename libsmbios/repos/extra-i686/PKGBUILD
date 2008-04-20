# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: daniel g. siegel <dgsiegel@gmail.com> 

pkgname=libsmbios
pkgver=2.0.2
pkgrel=1
pkgdesc="A library for providing access to as much BIOS information as possible"
arch=(i686 x86_64)
url="http://linux.dell.com/libsmbios/main/index.html"
license=('GPL' 'custom')
depends=('gcc-libs>=4.3.0')
source=(http://linux.dell.com/libsmbios/download/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
options=('!libtool')
md5sums=('3d079038c08495c2a46ec20544168bb4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static || return 1

  make || return 1
  make DESTDIR=${startdir}/pkg/ install || return 1

  install -m755 -d ${startdir}/pkg/usr/include

  cp -r include/smbios ${startdir}/pkg/usr/include/smbios || return 1
  find ${startdir}/pkg/usr/include/smbios -type d -exec chmod 0755 {} \; || return 1
  find ${startdir}/pkg/usr/include/smbios -type f -exec chmod 0644 {} \; || return 1
  chown -R root:root ${startdir}/pkg/usr/include/smbios || return 1

  rm -f ${startdir}/pkg/usr/include/smbios/version.h.in

  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 COPYING-OSL ${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1
}
