# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libassuan
pkgver=2.5.4
pkgrel=2
pkgdesc='IPC library used by some GnuPG related software'
url="https://www.gnupg.org/related_software/libassuan/"
arch=('x86_64')
license=('GPL3')
depends=('glibc' 'libgpg-error')
provides=('libassuan.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('764993d5311c24f0c0f970016e903e1a16783a2050c42072dbc1bc4f350f119e53b0be17ed6df25a0086bc9f8c25ee4f3134330577968480997263f95e05594f'
            'SKIP')
b2sums=('2eec42c47840741a4726fc35c3ed04300e5fbcd37f808b121534aeaa04d0d0f609a30ad48cfbe33a81ee4b2ebbb822b9a48a5c602268f1b802bf5d7d19d72e9c'
        'SKIP')
validpgpkeys=('6DAA6E64A76D2840571B4902528897B826403ADA') # "Werner Koch (dist signing 2020)"

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 {AUTHORS,NEWS,README,ChangeLog} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
