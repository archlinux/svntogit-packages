# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libassuan
pkgver=2.5.1
pkgrel=1
pkgdesc='IPC library used by some GnuPG related software'
url='http://www.gnupg.org/related_software/libassuan/'
arch=('x86_64')
license=('GPL')
depends=('libgpg-error')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6') # Werner Koch
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('47f96c37b4f2aac289f0bc1bacfa8bd8b4b209a488d3d15e2229cb6cc9b26449'
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
