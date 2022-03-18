#Maintainer: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison
pkgver=2.52.0
pkgrel=1
pkgdesc='File-synchronization tool'
#url='https://github.com/bcpierce00/unison/'
url='https://www.cis.upenn.edu/~bcpierce/unison/'
arch=('x86_64')
license=('GPL2')
optdepends=('gtk2: graphical interface')
makedepends=('ocaml>=4.11.0' 'emacs' 'lablgtk2')
source=("https://github.com/bcpierce00/unison/archive/v${pkgver}.tar.gz"
        'large.patch'
        'desktop')
sha512sums=('24cfb43b40a05f85164c43e8744216142db4cd74d9d09ba7178f25f794b0dcce252597fa1eb49a4133e63d891c8d23fd7472669cf9f52777bc6aa86b0a50e6f5'
            'e2f7a5e6e832ee9c694f36e399178652456d2047b22cba86603982cd6f6caf54e520fc87a8bde1940b2da46102cf3aa89f3e062c965efc77cd840b47e01b4d2f'
            '74526b1f583f49b3e1c68b72c9ab3d5875796b8b371c1388cf3b5b25aef8a0304023e9bb960b2ff9aec2eb989f712e99b2c049b8075529074f62ef9ffd6c1cdd')
options=('!makeflags')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed 's/region_of_string/region_of_bytes/' -i src/uigtk2.ml
	patch -p0 -i ../large.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	for ui in gtk2 text; do
		cp -a . build || true
		pushd build
		export CFLAGS=
		make all UISTYLE=$ui DEBUGGING=false THREADS=true
		mv src/unison src/unison-$ui
		mv src/unison-* ..
		popd
		rm -fr build
	done
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d "${pkgdir}"/usr/bin
	install -m755 unison-* "${pkgdir}"/usr/bin
	ln -s unison-text "${pkgdir}"/usr/bin/unison

	install -Dm644 ../desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 icons/U.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	for i in 16 24 32 48 256; do
		install -Dm644 icons/U.${i}x${i}x16m.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done
}
