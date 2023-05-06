# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xcalc
pkgver=1.1.2
pkgrel=1
pkgdesc="Scientific calculator for X"
arch=('x86_64')
url="https://cgit.freedesktop.org/xorg/app/xcalc/"
license=('custom')
depends=('libxaw')
optdepends=('xorg-fonts-100dpi: for some symbols or'
           'xorg-fonts-75dpi: for some symbols')
makedepends=('xorg-util-macros')
source=(https://xorg.freedesktop.org/archive/individual/app/xcalc-${pkgver}.tar.xz{,.sig})
sha512sums=('51da677dc88bcd7299ed8d678cb26b048fdb82a1983e1496a06253ee2dceefca4ac87d1a74432b4a76dcc11921a61339bb3d292607be46228164140b430bbad2'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd xcalc-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd xcalc-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
