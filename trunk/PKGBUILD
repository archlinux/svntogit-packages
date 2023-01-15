# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=feh
pkgver=3.9.1
pkgrel=2
pkgdesc='Fast and light imlib2-based image viewer'
url='https://feh.finalrewind.org/'
license=('custom:MIT')
arch=('x86_64')
depends=('curl' 'file' 'imlib2' 'libexif' 'libxinerama')
optdepends=('imagemagick: support more file formats'
            'jpegexiforient: set exif rotation tag')
makedepends=('libxt')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005')
source=("${url}${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('455c92711b588af149b945edc5c145f3e9aa137ed9689dabed49d5e4acac75fa'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr \
		exif=1 \
		help=1 \
		inotify=1 \
		magic=1 \
		stat64=1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
