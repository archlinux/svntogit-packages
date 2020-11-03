# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libassuan
pkgver=2.5.4
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url='https://www.gnupg.org/related_software/libassuan/'
arch=('x86_64')
license=('GPL')
depends=('libgpg-error')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('c080ee96b3bd519edd696cfcebdecf19a3952189178db9887be713ccbcb5fbf0'
            'SKIP')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # "Werner Koch (dist signing 2020)"

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
