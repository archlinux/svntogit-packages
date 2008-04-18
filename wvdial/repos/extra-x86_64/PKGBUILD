# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=wvdial
pkgver=1.60
pkgrel=2
pkgdesc="A dialer program to connect to the Internet"
arch=('i686' 'x86_64')
license=('custom')
depends=('wvstreams>=4.4.1-2' 'ppp' 'xplc')
source=(http://alumnit.ca/download/${pkgname}-${pkgver}.tar.gz)
url="http://alumnit.ca/wiki/index.php?page=WvDial"
md5sums=('27fbbde89f8fd9f6e735a8efa5217fc9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  #mkdir -p $startdir/pkg/usr/bin $startdir/pkg/etc/ppp/peers
  sed "s|prefix=.*|prefix=$startdir/pkg/usr|" -i Makefile || return 1
  sed "s|PPPDIR=.*|PPPDIR=$startdir/pkg/etc/ppp/peers|" -i Makefile || return 1
  make PREFIX=${startdir}/pkg/usr || return 1
  make PREFIX=${startdir}/pkg/usr PPPDIR=${startdir}/pkg/etc/ppp/peers install
  install -Dm644 COPYING.LIB ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING.LIB
}
