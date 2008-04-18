#$Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Mirko Messer <mirk@chao.ch>
pkgname=dhclient 
pkgver=3.0.6
pkgrel=2
pkgdesc="dhclient is standalone client from the dhcp package"
arch=(i686 x86_64)
url="http://www.isc.org/index.pl?/sw/dhcp/"
license=('custom')
depends=('bash')
options=('!makeflags')
source=(ftp://ftp.isc.org/isc/dhcp/dhcp-${pkgver}.tar.gz \
	arch-nm.patch
	fix-broken-resolvconf.patch
	fix-mac80211-wireless.patch)
md5sums=('724bad21ad8b638abadd5fcc07df1a0f'
         'c3ad862567cb63ae6589a0754aa685b3'
         '115ce66ffe0acda2042905612a2680a7'
         'c64dfcbb0f0f1a3328ec6a907c0239eb')
                           

build() {
  cd ${startdir}/src/dhcp-${pkgver}
  patch -Np1 -i ${startdir}/src/arch-nm.patch || return 1
  patch -Np1 -i ${startdir}/src/fix-broken-resolvconf.patch || return 1
  patch -Np1 -i ${startdir}/src/fix-mac80211-wireless.patch || return 1
  ./configure
  cd work*/minires && make || return 1
  cd ../dst && make || return 1
  cd ../omapip && make || return 1
  cd ../common && make || return 1
  cd ../client
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/dhcp-${pkgver}/LICENSE \
                ${startdir}/pkg/usr/share/licenses/${pkgname}/

  install -m755 -d ${startdir}/pkg/var/lib/dhclient
}
