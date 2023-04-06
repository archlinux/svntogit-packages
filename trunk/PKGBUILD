# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=feh
pkgver=3.10
pkgrel=1
pkgdesc='Fast and light imlib2-based image viewer'
url='https://feh.finalrewind.org/'
license=('custom:MIT')
arch=('x86_64')
depends=('curl' 'file' 'imlib2' 'libexif' 'libxinerama')
optdepends=('imagemagick: support more file formats'
            'jpegexiforient: set exif rotation tag')
makedepends=('libxt')
validpgpkeys=('781BB7071C6BF648EAEB08A1100D5BFB5166E005'  # Daniel Friesel <derf@finalrewind.org> 
              '64FE6EC055560F9EF13A304419E6E524EBB177BA') # Derf Null <derf@ccc.de>
source=("${url}${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha256sums=('1d71d1f6dcfe9ffee5e2766969a11978f7eb4fac7d7ae556f104c11f9c57cc98'
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
