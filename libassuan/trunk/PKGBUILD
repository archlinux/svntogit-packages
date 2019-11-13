# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=libassuan
pkgver=2.5.3
pkgrel=2
pkgdesc='IPC library used by some GnuPG related software'
url='https://www.gnupg.org/related_software/libassuan/'
arch=('x86_64')
license=('GPL')
depends=('libgpg-error')
validpgpkeys=('031EC2536E580D8EA286A9F22071B08A33BD3F06') # NIIBE Yutaka
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig})
sha256sums=('91bcb0403866b4e7c4bc1cc52ed4c364a9b5414b3994f718c70303f7f765e702'
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
