# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Bartłomiej Piotrowski
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jbig2dec
pkgver=0.19
_gsver=gs9530
pkgrel=1
pkgdesc='Decoder implementation of the JBIG2 image compression format'
url='https://jbig2dec.com/'
arch=('x86_64')
license=('GPL3')
depends=('libpng')
source=("https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/${_gsver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0d3ec8123b446b5b74846b189004c188e82cdf7b1c7ec3e02f98892aaa249fba0b0fe7f1db7036f2571b0ef2a5df22d1997d3d3f5479c9bef7851bf114134737')

prepare() {
	cd ${pkgname}-${pkgver}
	autoreconf -vfi
}

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
