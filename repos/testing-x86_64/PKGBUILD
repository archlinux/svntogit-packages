# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=pciutils
pkgver=3.9.0
pkgrel=2
pkgdesc="PCI bus configuration space access library and tools"
arch=(x86_64)
license=('GPL2')
url="https://mj.ucw.cz/sw/pciutils/"
depends=('glibc' 'hwdata' 'kmod')
makedepends=('git')
optdepends=('which: for update-pciids'
            'grep: for update-pciids'
	    'curl: for update-pciids')	
source=(#ftp://ftp.kernel.org/pub/software/utils/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        https://mj.ucw.cz/download/linux/pci/${pkgname}-${pkgver}.tar.gz{,.sign})
        #git+https://github.com/pciutils/pciutils.git#tag=v$pkgver?signed)
validpgpkeys=(
              'C466A56CADA981F4297D20C31F3D0761D9B65F0B' # Martin Mares <mj@ucw.cz>
             )
sha256sums=('8953a785b2e3af414434b8fdcbfb75c90758819631001e60dd3afb89b22b2331'
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
  rm -rf "$pkgdir"/usr/share/hwdata
}
