# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-iceauth
pkgver=1.0.9
pkgrel=1
pkgdesc="ICE authority file utility"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libice')
makedepends=('xorg-util-macros' 'xorgproto')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/iceauth-${pkgver}.tar.xz{,.sig})
sha512sums=('16b2f58008587cf1544037ca8b1c76dbb75eb043b3048b3064e66ba6b147962233f1453c2cf18bfb136dd6dd21d3e27b5219e17e1ab7b81dbe93fb6aff801a72'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd "${srcdir}/iceauth-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/iceauth-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
