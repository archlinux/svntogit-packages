# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=jfsutils
pkgver=1.1.15
pkgrel=8
pkgdesc='JFS filesystem utilities'
url='http://jfs.sourceforge.net'
arch=('x86_64')
license=('GPL')
depends=('util-linux')
source=("http://jfs.sourceforge.net/project/pub/${pkgname}-${pkgver}.tar.gz"
        'jfsutils-1.1.15-missing-includes.patch'
        'jfsutils-1.1.15-sysmacros.patch'
        'jfsutils-1.1.15-gcc10.patch'
        'jfsutils-1.1.15-format-security-errors.patch')
sha256sums=('244a15f64015ce3ea17e49bdf6e1a0fb4f9af92b82fa9e05aa64cb30b5f07a4d'
            '467f43ad5be91f57c01b3171b71d3c079f45d150290b02b06ebd32c6b22f5e2c'
            'fd1a4e794a3bf2ebdb4b81f582e147655d70aadd59689aacea0ccc32c6381a28'
            '491c8e4b4d95cc296e4b87b730e252ce37dafbabaae48aa653ae002df26266f2'
            '40e3ee196b139fec46b2df6047c2f052e7630d9c9e6669d4f70ca478165bc054')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../jfsutils-1.1.15-missing-includes.patch
	patch -p1 -i ../jfsutils-1.1.15-sysmacros.patch
	patch -p1 -i ../jfsutils-1.1.15-gcc10.patch
	patch -p1 -i ../jfsutils-1.1.15-format-security-errors.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sbindir=/usr/bin 
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
