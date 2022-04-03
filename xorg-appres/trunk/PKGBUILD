# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-appres
pkgver=1.0.6
pkgrel=1
pkgdesc="List X application resource database"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libxt')
makedepends=('xorg-util-macros')
conflicts=('xorg-res-utils')
source=(https://xorg.freedesktop.org/archive/individual/app/appres-${pkgver}.tar.xz{,.sig})
sha512sums=('6d14f6a2ad5c83a4d42d4c51ec9a9f32652dfe7624881f1f41c0b1f4946904e7e5ca81a2fd9f4f4824488ce1bd2a4047f92320626bf33b0f1afc5e6b89d3e2b9'
            'SKIP')
validpgpkeys+=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  cd "${srcdir}/appres-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/appres-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
