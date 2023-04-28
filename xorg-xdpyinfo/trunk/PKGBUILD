# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xdpyinfo
pkgver=1.3.4
pkgrel=1
pkgdesc="Display information utility for X"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11' 'libxext' 'libxtst' 'libxxf86vm' 'libxrender' 'libxcomposite' 'libxinerama')
makedepends=('xorg-util-macros' 'xorgproto')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xdpyinfo-${pkgver}.tar.xz{,.sig})
sha512sums=('9ef9f5c10e15a40895e8f008896b960fdd438277657c7159d16f05db79cd2374cfaca4af2f4e59335824bfd2f74a045ef89dd99ea4130ed436ea59fbbb1cbe12'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>

build() {
  cd xdpyinfo-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd xdpyinfo-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
