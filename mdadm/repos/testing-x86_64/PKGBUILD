# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
pkgname=mdadm
pkgver=4.1
pkgrel=1
pkgdesc="A tool for managing/monitoring Linux md device arrays, also known as Software RAID"
arch=(x86_64)
license=('GPL')
url="http://git.kernel.org/cgit/utils/mdadm"
groups=('base')
conflicts=('mkinitcpio<0.7')
depends=('glibc')
backup=('etc/mdadm.conf')
source=("https://www.kernel.org/pub/linux/utils/raid/mdadm/mdadm-4.1.tar."{xz,sign}
        mdadm.conf 
        mdadm_udev_install)
replaces=('raidtools')
validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
md5sums=('51bf3651bd73a06c413a2f964f299598'
         'SKIP'
         '5a37c112aa07dccdde62f9fa5b888607'
         'b6b0bfd6487c99264578630616dfe5eb')
build() {
  cd $srcdir/$pkgname-$pkgver
  make CXFLAGS="$CFLAGS" BINDIR=/usr/bin UDEVDIR=/usr/lib/udev
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTALL=/usr/bin/install BINDIR=/usr/bin DESTDIR=$pkgdir UDEVDIR=/usr/lib/udev install
  make SYSTEMD_DIR=$pkgdir/usr/lib/systemd/system install-systemd
  install -D -m644 ../mdadm.conf $pkgdir/etc/mdadm.conf
  install -D -m644 ../mdadm_udev_install $pkgdir/usr/lib/initcpio/install/mdadm_udev
  ln -s /usr/lib/initcpio/install/mdadm_udev $pkgdir/usr/lib/initcpio/install/mdadm
}
