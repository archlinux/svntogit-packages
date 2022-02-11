# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=feh
pkgver=3.8
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
source=("${url}${pkgname}-${pkgver}.tar.bz2"{,.asc}
        '0001-libmagic.patch')
sha256sums=('7f3c34552b39336d7ebee2d7c4bf5697aaaa2c6c102c357f6e82ea240bd62ba9'
            'SKIP'
            'cc2c7ca77c710001339cceb78225119e910bc6949ab2a3380b90caf84c0d3e41')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -Np1 < ../0001-libmagic.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr \
		exif=1 \
		help=1 \
		inotify=1 \
		stat64=1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
