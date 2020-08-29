#Maintainer: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison
pkgver=2.51.2
pkgrel=10
pkgdesc='File-synchronization tool'
#url='https://github.com/bcpierce00/unison/'
url='https://www.cis.upenn.edu/~bcpierce/unison/'
arch=('x86_64')
license=('GPL2')
optdepends=('gtk2: graphical interface')
makedepends=('ocaml>=4.11.0' 'emacs' 'lablgtk2')
source=("https://github.com/bcpierce00/unison/archive/v${pkgver}.tar.gz"
        'large.patch'
	'4.08-compatibility.patch'
        'desktop')
sha256sums=('a2efcbeab651be6df69cc9b253011a07955ecb91fb407a219719451197849d5e'
            '2a971cf17e0a7303e99a793829e2b7b03533d17041e3b2ebba53555a5bd62284'
            '7c97ac4a13d6865dad0b447d519566dba3adaa777d2c2aa2014d4e5d7d8c0c13'
            '2dc5c53386cc065706e6c901d1a1a205808e449dc9676320d1de7a5dd673e174')

options=('!makeflags')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed 's/region_of_string/region_of_bytes/' -i src/uigtk2.ml
	patch -p0 -i ../large.patch
	patch -p1 -i ../4.08-compatibility.patch
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
