# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=feh
pkgver=2.28
pkgrel=1
pkgdesc='Fast and light imlib2-based image viewer'
url='https://feh.finalrewind.org/'
license=('custom:MIT')
arch=('x86_64')
depends=('imlib2' 'curl' 'libxinerama' 'libexif')
optdepends=('imagemagick: support more file formats'
            'jpegexiforient: set exif rotation tag')
makedepends=('libxt')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("${url}${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('13d22d7c5fe5057612ce3df88857aee89fcab9c8cd6fd4f95a42fe6bf851d3d9'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr exif=1 help=1 stat64=1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
