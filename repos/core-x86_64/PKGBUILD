# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=zstd
pkgver=1.5.2
pkgrel=3
pkgdesc='Zstandard - Fast real-time compression algorithm'
url='https://facebook.github.io/zstd/'
arch=(x86_64)
license=(BSD GPL2)
depends=(glibc gcc-libs zlib xz lz4)
makedepends=(gtest)
provides=(libzstd.so)
options=(debug)
source=(https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.zst{,.sig})
sha256sums=('3ea06164971edec7caa2045a1932d757c1815858e4c2b68c7ef812647535c23f'
            'SKIP')
b2sums=('513e4526a92bcb59416b3457d186a30e554f9e0cf21d7114eb3e9fbcbd9d662c8d95cf0b06237f6fe3f756862c63de0aa146d6a23cb4111c16e6459608d115f1'
        'SKIP')
validpgpkeys=(4EF4AC63455FC9F4545D9B7DEF8FE99528B52FFD)

build() {
  cd ${pkgname}-${pkgver}
  # Set PREFIX, as libzstd.pc is otherwise generated with -L/usr/local
  make PREFIX=/usr
  make -C contrib/pzstd
}

check() {
  cd ${pkgname}-${pkgver}
  make check
  make -C contrib/pzstd test
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  ln -sf /usr/bin/zstd "${pkgdir}/usr/bin/zstdmt"
  install -Dm 755 contrib/pzstd/pzstd -t "${pkgdir}/usr/bin"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
