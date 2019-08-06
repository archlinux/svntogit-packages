# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=flac
pkgname=('flac' 'flac-doc')
pkgver=1.3.3
pkgrel=1
pkgdesc='Free Lossless Audio Codec'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('gcc-libs' 'libogg')
makedepends=('nasm' 'doxygen')
source=(https://downloads.xiph.org/releases/flac/${pkgbase}-${pkgver}.tar.xz)
sha256sums=('213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748')
sha512sums=('d6417e14fab0c41b2df369e5e39ce62a5f588e491af4d465b0162f74e171e5549b2f061867f344bfbf8aaccd246bf5f2acd697e532a2c7901c920c69429b1a28')

build() {
  cd ${pkgbase}-${pkgver}
  ./configure \
    --prefix=/usr \
    --disable-sse
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_flac() {
  options=('!docs')
  provides=('libFLAC.so' 'libFLAC++.so')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_flac-doc() {
  pkgdesc+=' documentation'
  depends=('flac')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" -C doc install
  sed -i "s|${srcdir}/${pkgbase}-${pkgver}|/usr|" "${pkgdir}/usr/share/doc/${pkgbase}/FLAC.tag"
  install -Dm 644 COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
