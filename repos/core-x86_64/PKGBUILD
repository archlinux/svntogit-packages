# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libassuan
pkgver=2.5.2
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url='http://www.gnupg.org/related_software/libassuan/'
arch=('x86_64')
license=('GPL')
depends=('libgpg-error')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('986b1bf277e375f7a960450fbb8ffbd45294d06598916ad4ebf79aee0cb788e7'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
