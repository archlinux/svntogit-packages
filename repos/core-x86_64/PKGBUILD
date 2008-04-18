# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=cryptsetup
pkgver=1.0.6
pkgrel=1
pkgdesc="Userspace setup tool for transparent encryption of block devices using the Linux 2.6 cryptoapi"
arch=(i686 x86_64)
license=('GPL')
url="http://luks.endorphin.org/dm-crypt"
groups=('base')
depends=('device-mapper' 'libgcrypt' 'popt' 'e2fsprogs')
options=('!libtool' '!emptydirs')
source=(http://luks.endorphin.org/source/cryptsetup-$pkgver.tar.bz2
        encrypt_hook
	encrypt_install
	luksOpen-status.patch)
md5sums=('00d452eb7a76e39f5749545d48934a10'
         '40fee2419cd444cfb283c311f9555d2d'
         '24b76e9cb938bc3c8dcff396cbab28c7'
         'd4be8d2059d5427c057be4de4e948887')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # suppress "Command successful" message on luksOpen
  patch -p1 -i $startdir/src/luksOpen-status.patch
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install
  # include a static cryptsetup binary for initrd setups
  make clean
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-static
  make || return 1
  # include a static cryptsetup binary for initrd setups
  install -D -m755 src/cryptsetup $startdir/pkg/sbin/cryptsetup.static || return 1
  # install hook
  install -D -m644 $startdir/src/encrypt_hook $startdir/pkg/lib/initcpio/hooks/encrypt
  install -D -m644 $startdir/src/encrypt_install $startdir/pkg/lib/initcpio/install/encrypt
}
