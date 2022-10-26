# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=mkinitcpio
pkgver=32
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
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        "fix-strip.patch::https://github.com/archlinux/mkinitcpio/commit/dece596d569ca90af902bf2403227b478b629c03.patch")
install=mkinitcpio.install
sha512sums=('c180bef8af774305e8c9779b3405daaa5be33588bf89c6625a28eac1cde424f447782737d85d810fed4971d38b31086a072293d42aad08398c090f9538b56a4e'
            'SKIP'
            'd19718f92916e00cece4e213bd7bd1cbf55b0094a39c459aaa995442342b64eb3fe8ec0bf023074f7ea26474a6fe2dc0370e0663823ed08ec5d33f6f645b833c')
b2sums=('0c29659278e662eb58bc776f99e9579b5f0cf3268175382ecf2d635d54a6a8261ae173e387503a0c20a7492656c703a6699b52e1a6693c85c3211225d3e7abf8'
        'SKIP'
        '2b404010d5edb4b7eac36e25f0bf1c7958b7bc7b9740a1fda859579de48dc47552d9eee1d40abb8d2ebf1dffc523a64797c834bba59a22bab9e537ad12e991c7')
validpgpkeys=('ECCAC84C1BA08A6CC8E63FBBF22FB1D78A77AEAB'    # Giancarlo Razzolini
              'C100346676634E80C940FB9E9C02FF419FECBE16')   # Morten Linderud

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 < "$srcdir/fix-strip.patch"
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
