# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=xz
pkgver=5.2.5
pkgrel=2
pkgdesc='Library and command line tools for XZ and LZMA compressed files'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('sh')
source=("https://tukaani.org/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('f6f4910fd033078738bd82bfba4f49219d03b17eb0794eb91efbae419f4aba10'
            'SKIP')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export CFLAGS="$CFLAGS -Wno-format-truncation"
	./configure --prefix=/usr \
		--disable-rpath \
		--enable-werror
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -d -m755 "${pkgdir}/usr/share/licenses/xz/"
	ln -sf /usr/share/doc/xz/COPYING "${pkgdir}/usr/share/licenses/xz/"
	ln -sf /usr/share/licenses/common/GPL2/license.txt "${pkgdir}/usr/share/doc/xz/COPYING.GPLv2"
}
