# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Frederick Zhang <frederick888@tsundere.moe>

pkgname=aribb25
pkgver=0.2.7
pkgrel=2
pkgdesc='Library for ARIB STD-B25, decoding JIS 8 bit characters and parsing MPEG-TS stream'
url='https://code.videolan.org/videolan/aribb25'
arch=('x86_64')
license=('custom:ISC')
depends=('glibc' 'pcsclite')
provides=('libaribb25.so')
source=("${url}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha512sums=('1f4f9aa40586d5984b30dd8972c258ef5003a60f2ab91ec56aff702be406e3d10a24868de0f188d215dbc497db23f734ffbcc8dcbc7b51de8edcfcbac7c0052e')
b2sums=('c3458f76fd43516e1b114d799e0455ee9adaa9aec627ec1444219e67a01bc89a9267c287da34696ee5b8564c107f9740353af2e7a9c3e4bdea218bbb24640f71')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
