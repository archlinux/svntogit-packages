# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=flac
pkgname=('flac' 'flac-doc')
pkgver=1.3.3
pkgrel=3
pkgdesc='Free Lossless Audio Codec'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('gcc-libs' 'libogg')
makedepends=('nasm' 'doxygen')
source=(https://downloads.xiph.org/releases/flac/${pkgbase}-${pkgver}.tar.xz
        https://github.com/xiph/flac/commit/2e7931c.patch
        https://github.com/xiph/flac/commit/ced7f68.patch)
sha512sums=('d6417e14fab0c41b2df369e5e39ce62a5f588e491af4d465b0162f74e171e5549b2f061867f344bfbf8aaccd246bf5f2acd697e532a2c7901c920c69429b1a28'
            '56182fb46cbefcd34137ec0e93ec540bc029e1e2cb4787444178ee941ae03cc73bd360c87ec3735a6ca524044d28f22253fe37a42fdb93aea7def65178ea663b'
            'c5f17f6afa7358ba1dd610b7fe9d576f217ac7f71a8edf7833cfa2ed6a971a8d2c69468e96c35b97ffb6b019cb1be89dc23fe839ee19e445a6eef6cc74d2f435')

prepare() {
  cd ${pkgbase}-${pkgver}
  # CVE-2020-0499
  patch -p1 -i ../2e7931c.patch
  # Add some overflow checks for residual bits calculation
  patch -p1 -i ../ced7f68.patch
}

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
