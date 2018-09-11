# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=24
pkgrel=2
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive'
         'coreutils' 'bash' 'findutils' 'grep' 'filesystem>=2011.10-1' 'gzip' 'systemd')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        0001-Restore-addition-of-modules-from-config-file.patch)
install=mkinitcpio.install
sha256sums=('ec0ecbc518c14ecacf5a8ece2f068fe86fcaf3aed09ee6b82737e773e5d7d02b'
            'SKIP'
            'd4cbbf7b05f5dcaf23139469376ff6c29e948ce77a8c51ad4867413b4bddc4db')
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'   # Dave Reisner
              '86CFFCA918CF3AF47147588051E8B148A9999C34')  # Evangelos Foutras

prepare() {
  cd "$pkgname-$pkgver"

  patch -Np1 <"$srcdir"/0001-Restore-addition-of-modules-from-config-file.patch
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
