# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libassuan
pkgver=2.5.5
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url="https://www.gnupg.org/related_software/libassuan/"
arch=('x86_64')
license=('GPL3')
depends=('glibc' 'libgpg-error')
provides=('libassuan.so')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha512sums=('70117f77aa43bbbe0ed28da5ef23834c026780a74076a92ec775e30f851badb423e9a2cb9e8d142c94e4f6f8a794988c1b788fd4bd2271e562071adf0ab16403'
            'SKIP')
b2sums=('24952e97c757b97c387ab4c2c4bf7b040f2874e9326c129805c7f5326fa14d80e083b0842e336a635531a2c8d4a66d428c816bae6b175f1c4518add1ffa3554d'
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
