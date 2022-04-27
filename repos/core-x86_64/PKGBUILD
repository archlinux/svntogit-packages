# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=pciutils
pkgver=3.8.0
pkgrel=1
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64)
license=('GPL2')
url="https://mj.ucw.cz/sw/pciutils/"
depends=('glibc' 'hwdata' 'kmod')
makedepends=('git')
source=(#ftp://ftp.kernel.org/pub/software/utils/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        https://mj.ucw.cz/download/linux/pci/${pkgname}-${pkgver}.tar.gz{,.sign})
        #git+https://github.com/pciutils/pciutils.git#tag=v$pkgver?signed)
validpgpkeys=(
              '5558F9399CD7836850553C6EC28E7847ED70F82D' # Martin Mares <mj@ucw.cz>
             )
sha256sums=('3f398d983aab42f3872e4e0ee9ecb1f0fd68f028e00246aa2ca7c3a7408d6fab'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  make OPT="${CFLAGS} -fPIC -DPIC" ZLIB=no SHARED=no PREFIX=/usr SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man SBINDIR=/usr/bin lib/libpci.a 
  cp lib/libpci.a "${srcdir}/"
  make clean
  make OPT="${CFLAGS}" ZLIB=no SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man all
}

package() {
  cd $pkgname-$pkgver
  make SHARED=yes PREFIX=/usr SBINDIR=/usr/bin SHAREDIR=/usr/share/hwdata MANDIR=/usr/share/man DESTDIR="${pkgdir}" install install-lib
  # this is now supplied by the hwids package
  rm -rf "$pkgdir"/usr/{sbin/update-pciids,share/{man/man8/update-pciids.8,hwdata}}
}
