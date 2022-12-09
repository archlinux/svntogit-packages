# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=34
pkgrel=2
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'systemd')
checkdepends=('bash-bats' 'bash-bats-assert' 'lzop')
optdepends=('gzip: Use gzip compression for the initramfs image'
            'xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        '0001-functions-fix-overwriting-of-symlinks-with-regular-f.patch')
install=mkinitcpio.install
sha512sums=('cf8ab66d4609911ca6a1d2af1bfcf320eed99d29657c0ccfeca2fdc8ea00cfb6575e55645424de13fcf37aa12a39ac7b43a330c716e73e9c16a75178738ebe70'
            'SKIP'
            'a43e66101edc301ae893a25eee6caa83c56a790cbac1685697fb999008c8210e46ca49e0700242f8321731264084462641285954db55d3daa2c7e8b62d1cc66c')
b2sums=('06a6c6a0951b9b6161e2db01e2956d87da303b2ec029bdd183efed3b074b176a9f107e9a723fc6a7fa157ecd703d7627d8aaa0b9290022a09e30daa46784841c'
        'SKIP'
        'a2ed9e8ff4b6fab1d6f6c1dae4dcf890b4434cb31ebdfe73ea54fd4af499849e2b98e565915cc331bd97f15f21d9147ee0499cf75b516562bfd7f1793e838e99')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
  patch -Np1 -d "$pkgname-$pkgver" < '0001-functions-fix-overwriting-of-symlinks-with-regular-f.patch'
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
