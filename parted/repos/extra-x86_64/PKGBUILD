# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=parted
pkgver=3.5
pkgrel=1
pkgdesc='A program for creating, destroying, resizing, checking and copying partitions'
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/parted/parted.html'
depends=('device-mapper' 'util-linux-libs')
makedepends=('pkg-config')
options=('debug')
validpgpkeys=('1B49F933916A37A3F45A1812015F4DD4A70FB705'  # Phillip Susi <psusi@ubuntu.com>
              'B4C6B451E4FA8B4232CA191E117E8C168EFE3A7F') # Brian C. Lane <bcl@redhat.com>
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('4938dd5c1c125f6c78b1f4b3e297526f18ee74aa43d45c248578b1d2470c05a2'
            'SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Do *not* add --disable-debug, it prevents building fatresize
  # https://github.com/ya-mouse/fatresize/issues/9
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --disable-rpath
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
