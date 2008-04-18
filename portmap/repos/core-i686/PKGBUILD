# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=portmap
pkgver=6.0
pkgrel=2
pkgdesc="RPC connection manager"
arch=(i686 x86_64)
depends=('glibc')
url="http://neil.brown.name/portmap/"
license=('GPL')
source=(http://neil.brown.name/portmap/portmap-6.0.tgz portmap)
md5sums=('ac108ab68bf0f34477f8317791aaf1ff'
         'ec37d014a47adc39e52e4bf31bf2a19a')

build() {
  cd $startdir/src/portmap_$pkgver
  make || return 1
  mkdir -p $startdir/pkg/sbin
  mkdir -p $startdir/pkg/usr/share/man/man8
  make BASEDIR=$startdir/pkg install
  mkdir -p $startdir/pkg/etc/rc.d
  cp ../portmap $startdir/pkg/etc/rc.d
}
