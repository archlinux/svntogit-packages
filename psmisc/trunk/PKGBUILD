# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=psmisc
pkgver=23.6
pkgrel=1
pkgdesc='Miscellaneous procfs tools'
arch=('x86_64')
url='https://gitlab.com/psmisc/psmisc'
license=('GPL')
depends=('ncurses')
validpgpkeys=('5D2FB320B825D93904D205193938F96BDF50FEA5') # Craig Small <csmall@debian.org>
source=("https://downloads.sourceforge.net/psmisc/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('257dde06159a4c49223d06f1cccbeb68933a4514fc8f1d77c64b54f0d108822a'
            'SKIP')

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
