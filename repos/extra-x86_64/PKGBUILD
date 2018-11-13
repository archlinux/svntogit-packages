# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgbase=flac
pkgname=('flac' 'flac-doc')
pkgver=1.3.2
pkgrel=2
arch=('x86_64')
url="http://flac.sourceforge.net/"
license=('BSD' 'GPL')
depends=('gcc-libs' 'libogg')
makedepends=('nasm' 'doxygen')
options=('!makeflags')
source=(https://downloads.xiph.org/releases/flac/${pkgbase}-${pkgver}.tar.xz)
sha1sums=('2bdbb56b128a780a5d998e230f2f4f6eb98f33ee')

build() {
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr --disable-sse
  make
}

check() {
  cd ${pkgbase}-${pkgver}
  make check
}

package_flac() {
  pkgdesc="Free Lossless Audio Codec"
  options=('!docs')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING.Xiph "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_flac-doc() {
  pkgdesc="Developer documentation for the Free Lossless Audio Codec"
  depends=('flac')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" -C doc install
  sed -i "s|$srcdir/${pkgbase}-${pkgver}|/usr|" "${pkgdir}/usr/share/doc/${pkgbase}-${pkgver}/FLAC.tag"
  install -D -m644 COPYING.Xiph "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
