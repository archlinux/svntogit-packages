# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-twm
pkgver=1.0.12
pkgrel=1
pkgdesc="Tab Window Manager for the X Window System"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
backup=(usr/share/X11/twm/system.twmrc)
license=('custom')
depends=('libxmu')
makedepends=('xorg-util-macros')
options=('!emptydirs')
source=(${url}/releases/individual/app/twm-${pkgver}.tar.xz{,.sig})
sha512sums=('f3d68df7e06516f6b74f19181efcfd9db2479c8ea0c72c3a6ed0dc1b222405b40d81a2dea17b662955e0c1783e87d0d3eb067c3b6e7c6eed8c0d38d03d362260'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alan.coopersmith@oracle.com>
#validpgpkeys+=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

build() {
  cd twm-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd twm-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
