# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-xev
pkgver=1.2.5
pkgrel=1
pkgdesc='Print contents of X events'
url='https://xorg.freedesktop.org/'
arch=('x86_64')
license=('custom')
depends=('libx11' 'libxrandr')
makedepends=('xorg-util-macros' 'xorgproto')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xev-${pkgver}.tar.xz{,.sig})
sha512sums=('9fbfb78c9547974c2256a678948bf4a694a40b1c2bd5c5dec5f365a713e6d938c6039f055a9629f49de27f02f3d7cb912f07c035df129798a4b2ddc20febe66a'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>
#validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>" 

build() {
  cd xev-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd xev-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
