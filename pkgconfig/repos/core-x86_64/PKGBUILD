# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=pkgconfig
pkgver=0.22
pkgrel=3
pkgdesc="A system for managing library compile/link flags"
arch=(i686 x86_64)
url="http://www.freedesktop.org/Software/pkgconfig"
license=('GPL')
groups=('base-devel')
depends=(glibc)
source=(http://pkgconfig.freedesktop.org/releases/pkg-config-${pkgver}.tar.gz)
md5sums=('fd5c547e9d66ba49bc735ccb8c791f2a')

build() {
  cd ${startdir}/src/pkg-config-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
