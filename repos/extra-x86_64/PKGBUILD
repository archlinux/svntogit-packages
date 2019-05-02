# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=parted
pkgver=3.2
pkgrel=9
pkgdesc="A program for creating, destroying, resizing, checking and copying partitions"
arch=('x86_64')
license=('GPL3')
url='https://www.gnu.org/software/parted/parted.html'
depends=('device-mapper' 'libutil-linux')
makedepends=('pkg-config')
validpgpkeys=('1B49F933916A37A3F45A1812015F4DD4A70FB705') # Phillip Susi <psusi@ubuntu.com>
source=("https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig}
        '0001-fat16.patch'
        '0002-include.patch')
sha256sums=('858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4'
            'SKIP'
            '20f54040e58bbbef6ed043c8be98dda5696035349c3efad850972c938f08f84a'
            '789d6ef8fcff389f9f74bd9e377aff9949ab5b317a80bd38cec39510bd40cef6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/0001-fat16.patch"
  patch -Np1 -i "${srcdir}/0002-include.patch"
}

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
