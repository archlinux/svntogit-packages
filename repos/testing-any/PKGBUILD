# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=30
pkgrel=1
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url="https://projects.archlinux.org/mkinitcpio.git/"
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'systemd')
optdepends=('gzip: Use gzip compression for the initramfs image'
            'xz: Use lzma or xz compression for the initramfs image'
            'bzip2: Use bzip2 compression for the initramfs image'
            'lzop: Use lzo compression for the initramfs image'
            'lz4: Use lz4 compression for the initramfs image'
            'mkinitcpio-nfs-utils: Support for root filesystem on NFS')
provides=('initramfs')
backup=('etc/mkinitcpio.conf')
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
install=mkinitcpio.install
sha512sums=('ef43a8ddc01697fa43bede4eebad3271bbc89efa57ba7e4e9f321e8174ff2af74d857b308c5c0f37b42a91906c91c1b022f9a651c70d5d3e9dfc8dc441a60ee4'
            'SKIP')
b2sums=('2001f9ac12bfa7369ad32842956cd21b2a786cd28133b6d3256e4aa77210c78ec6cac8a710ff8c2feb5a4797c1a33ce8c8c7dfabd84d7927c08bf8377e330300'
        'SKIP')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              '86CFFCA918CF3AF47147588051E8B148A9999C34')   # Evangelos Foutras

# prepare() {
#   cd $pkgname-$pkgver
# }

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
