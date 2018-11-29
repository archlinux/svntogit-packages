#Maintainer: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison
pkgver=2.51.2
pkgrel=3
pkgdesc='File-synchronization tool'
#url='https://github.com/bcpierce00/unison/'
url='https://www.cis.upenn.edu/~bcpierce/unison/'
arch=('x86_64')
license=('GPL2')
optdepends=('gtk2: graphical interface')
makedepends=('ocaml' 'emacs' 'lablgtk2')
source=("https://github.com/bcpierce00/unison/archive/v${pkgver}.tar.gz"
        'large.patch'
        'desktop')
sha256sums=('a2efcbeab651be6df69cc9b253011a07955ecb91fb407a219719451197849d5e'
            '2a971cf17e0a7303e99a793829e2b7b03533d17041e3b2ebba53555a5bd62284'
            'b497b1c23cceb8967e9c3f9a39720e3029d370304ae410795121224f96c234a3')

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

	install -d "${pkgdir}"/usr/share/{pixmaps,applications}
	install -m644 icons/U.32x32x16m.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -m644 ../desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
