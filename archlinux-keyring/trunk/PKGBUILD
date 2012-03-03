# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=archlinux-keyring
pkgver=20120303
pkgrel=1
pkgdesc='Arch Linux PGP keyring'
arch=('any')
url='https://projects.archlinux.org/archlinux-keyring.git/'
license=('GPL')
install="${pkgname}.install"
source=("ftp://ftp.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "ftp://ftp.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
md5sums=('42f09f33b110bec53a80dfb7e8d2bade'
         '19528f9c64ff41c75f8e15e162bb95fb')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
}
