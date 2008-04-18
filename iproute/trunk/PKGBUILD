# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=iproute
_dlver=2.6.24-rc7
pkgver=$(echo ${_dlver} | sed 's|-|_|g')
pkgrel=1
pkgdesc="IP Routing Utilities"
arch=(i686 x86_64)
license=('GPL')
url="http://www.linux-foundation.org/en/Net:Iproute2"
depends=('db>=4.6')
source=(http://devresources.linux-foundation.org/dev/iproute2/download/iproute2-${_dlver}.tar.bz2)
md5sums=('e4d8352451e61e94f3ee7e6c0cadba4c')
force=y

build() {
  cd $startdir/src/iproute2-${_dlver}
  sed -i 's|/usr/local/lib/iptables|/usr/lib/iptables|' include/iptables.h || return 1
  ./configure 
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  chmod 755 $startdir/pkg/usr/sbin/ifcfg
}
