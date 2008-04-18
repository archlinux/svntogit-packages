# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
#Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=dmraid
pkgver=1.0.0.rc14
pkgrel=4
pkgdesc="Device mapper RAID interface"
url="http://people.redhat.com/~heinzm/sw/dmraid/"
depends=(device-mapper)
arch=('i686' 'x86_64')
license=('GPL')
source=(http://people.redhat.com/~heinzm/sw/dmraid/src/$pkgname-$pkgver.tar.bz2
        dmraid_install
        dmraid_hook)
md5sums=(a0e7d0bb5394e15c878ac86afd72c08e
         8f8b6fb332fce85a27d72fc63385db70
         8c944cab8c885192a90e518a8d794adf)

build() {
  cd $startdir/src/$pkgname/$pkgver

  # create static bin
  ./configure --enable-static_link --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg exec_prefix=$startdir/pkg/usr install
  mv $startdir/pkg/usr/sbin/dmraid $startdir/pkg/usr/sbin/dmraid.static

  # create dynamic linked bin
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg exec_prefix=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/var/lock/dmraid
  chmod 1777 $startdir/pkg/var/lock/

  install -D -m755 $startdir/src/dmraid_install $startdir/pkg/lib/initcpio/install/dmraid
  install -D -m755 $startdir/src/dmraid_hook $startdir/pkg/lib/initcpio/hooks/dmraid
}
