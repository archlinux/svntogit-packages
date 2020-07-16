# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=27
pkgrel=4
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'gzip' 'systemd')
optdepends=('xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        "0001-mkinitcpio-remove-preset-pacsave.patch")
install=mkinitcpio.install
sha256sums=('e6bff1cb78b677538eb9aace900b715fd59de8fc210b74fb9d899dfaa32bc354'
            'SKIP'
            '845569fa760f70c868ecb3dc8ae9667287970526dddaf403fdafcb716e8b3d51')
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'   # Dave Reisner
              '86CFFCA918CF3AF47147588051E8B148A9999C34'   # Evangelos Foutras
              'ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB')  # Giancarlo Razzolini

prepare() {
  cd $pkgname-$pkgver
  # Apply 0001-mkinitcpio-remove-preset-pacsave.patch
  patch -Np1 < $srcdir/0001-mkinitcpio-remove-preset-pacsave.patch
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
