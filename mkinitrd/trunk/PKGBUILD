# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org> 
pkgname=mkinitrd 
pkgver=1.01
pkgrel=31
pkgdesc="A tool to create the initrd image"
arch=(i686 x86_64)
url="http://www.busybox.net/" 
depends=('bash')  
backup=('etc/mkinitrd.conf')
source=(http://www.busybox.net/downloads/busybox-$pkgver.tar.bz2 \
        bb-mkrootdev.patch mkinitrd config mkinitrd.conf) 
md5sums=('f250842dae2854a38470ed16a46bba66' '00e92e5dca9749b3a18b1c5af448eca7'\
         '634e6e60434dc92c6c96b06ccea01c5f' '92465f79f20fd0bd9d503a921c605165'\
         '3106890cee88577401746b9df70eb219')

build() { 
  cd $startdir/src/busybox-$pkgver
  patch -Np1 -i ../bb-mkrootdev.patch || return 1
  cp ../config .config
  make -j1 OPTIMIZATION="${CFLAGS}"
  install -D -m 755 busybox $startdir/pkg/sbin/busybox
  install -D -m 755 $startdir/src/mkinitrd $startdir/pkg/sbin/mkinitrd
  install -D -m 644 $startdir/src/mkinitrd.conf $startdir/pkg/etc/mkinitrd.conf
  mkdir -p $startdir/pkg/initrd
}
