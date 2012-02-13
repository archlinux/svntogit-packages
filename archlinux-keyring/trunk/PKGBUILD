# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=archlinux-keyring
pkgver=20120213
pkgrel=1
pkgdesc='Arch Linux PGP keyring'
arch=('any')
url='https://projects.archlinux.org/archlinux-keyring.git/'
license=('GPL')
install="${pkgname}.install"
source=("ftp://ftp.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "ftp://ftp.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
md5sums=('0bce827a30ddbea42b38cc24d1691ac5'
         '27275509ea3ff9d0c24e6b0ba47878a8')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
}
