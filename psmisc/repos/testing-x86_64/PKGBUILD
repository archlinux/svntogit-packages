# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=psmisc
pkgver=23.4
pkgrel=1
pkgdesc='Miscellaneous procfs tools'
arch=('x86_64')
url='https://gitlab.com/psmisc/psmisc'
license=('GPL')
depends=('ncurses')
source=("https://downloads.sourceforge.net/psmisc/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7f0cceeace2050c525f3ebb35f3ba01d618b8d690620580bdb8cd8269a0c1679')

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
