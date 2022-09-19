# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=beep
pkgver=1.4.12
pkgrel=1
pkgdesc='Advanced PC speaker beeping program'
url='https://github.com/spkr-beep/beep'
arch=('x86_64')
license=('GPL2')
depends=('glibc')
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('18fed77bc4820ecc84ac12e903d516d5228fa2038df1788cc68db76e40b3c47a271911cc45bc48ce94e3f215803c5c05cb6c08ebb47ae6d7fcf1e0bc1ac169cd')
b2sums=('06f21cf3c40389acca50e6e420af4e738b7484e096bb689345fedb37684b15733dbb38e8a5d0d360f23e020cebe9ba321984ee43f41b0ad980648414ddbb9375')

build() {
  cd ${pkgname}-${pkgver}
  make prefix=/usr
}

package() {
  cd ${pkgname}-${pkgver}
  make prefix=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
