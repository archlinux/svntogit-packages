# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=31
pkgrel=2
pkgdesc="Modular initramfs image creation utility"
arch=('any')
url='https://github.com/archlinux/mkinitcpio'
license=('GPL')
depends=('awk' 'mkinitcpio-busybox>=1.19.4-2' 'kmod' 'util-linux>=2.23' 'libarchive' 'coreutils'
         'bash' 'binutils' 'diffutils' 'findutils' 'grep' 'filesystem>=2011.10-1' 'zstd' 'systemd')
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
sha512sums=('4ef87c2e4f579b292c38f9c487e78b3b99f6db77909cab322e860e5ca70aca3747fcfc272e2e15c9a3605c924ab178057b8b23151f98debc5d96e65f3c0c49d5'
            'SKIP')
b2sums=('0113e288906e3b5fa485c29c00e7df60d85addd96718c45531031a686f18c739fa18303b6cac374d35b85edb7b663e221c8dc9158dff08c75858a4ed4dd154bf'
        'SKIP')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB')    # Giancarlo Razzolini

# prepare() {
#   cd $pkgname-$pkgver
# }

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
