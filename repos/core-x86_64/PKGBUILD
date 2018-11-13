# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
pkgname=mdadm
pkgver=4.0
pkgrel=2
pkgdesc="A tool for managing/monitoring Linux md device arrays, also known as Software RAID"
arch=(x86_64)
license=('GPL')
url="http://neil.brown.name/blog/mdadm"
groups=('base')
conflicts=('mkinitcpio<0.7')
depends=('glibc')
backup=('etc/mdadm.conf')
source=("https://www.kernel.org/pub/linux/utils/raid/mdadm/mdadm-4.0.tar."{xz,sign}
        mdadm.conf 
        mdadm_install
        mdadm_hook
        mdadm_udev_install
        disable-werror.patch)
replaces=('raidtools')
validpgpkeys=('6A86B80E1D22F21D0B26BA75397D82E0531A9C91') # Jes Sorensen
md5sums=('2cb4feffea9167ba71b5f346a0c0a40d'
         'SKIP'
         '5a37c112aa07dccdde62f9fa5b888607'
         'af2f73f0094ebee66f503ca4710c7142'
         'fbfb7d07efcbaf5dc61af424c5f6e352'
         'b6b0bfd6487c99264578630616dfe5eb'
         '599745ed2bec4489e83991cff89c46ee')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 -i ../disable-werror.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make CXFLAGS="$CFLAGS" BINDIR=/usr/bin UDEVDIR=/usr/lib/udev
  # build static mdassemble for Arch's initramfs
  make MDASSEMBLE_AUTO=1 mdassemble
  
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make INSTALL=/usr/bin/install BINDIR=/usr/bin DESTDIR=$pkgdir UDEVDIR=/usr/lib/udev install
  make SYSTEMD_DIR=$pkgdir/usr/lib/systemd/system install-systemd
  install -D -m755 mdassemble $pkgdir/usr/bin/mdassemble
  install -D -m644 ../mdadm.conf $pkgdir/etc/mdadm.conf
  install -D -m644 ../mdadm_install $pkgdir/usr/lib/initcpio/install/mdadm
  install -D -m644 ../mdadm_hook $pkgdir/usr/lib/initcpio/hooks/mdadm
  install -D -m644 ../mdadm_udev_install $pkgdir/usr/lib/initcpio/install/mdadm_udev
}
