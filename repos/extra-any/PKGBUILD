# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=mdds
pkgver=2.0.3
pkgrel=1
pkgdesc="A collection of multi-dimensional data structures and indexing algorithms"
arch=('any')
url="https://gitlab.com/mdds/mdds"
license=('MIT')
checkdepends=('boost')
#source=(https://gitlab.com/mdds/mdds/repository/archive.tar.gz?ref=${pkgver})
source=(https://kohei.us/files/mdds/src/${pkgname}-${pkgver}.tar.xz)
# checksums listed there - https://gitlab.com/mdds/mdds/-/releases
sha256sums=('6c01cdbd7f662a7adee5a6879d31130815fd31048d940f1b780ed67b719fc8e4')

build() {
  cd ${pkgname}-${pkgver}
  ./autogen.sh --prefix=/usr
  # make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
