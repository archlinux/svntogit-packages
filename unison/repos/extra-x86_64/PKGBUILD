#Maintainer: Gaetan Bisson <bisson@archlinux.org>
#Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison
pkgver=2.53.3
pkgrel=1
pkgdesc='File-synchronization tool'
#url='https://github.com/bcpierce00/unison/'
url='https://www.cis.upenn.edu/~bcpierce/unison/'
arch=('x86_64')
license=('GPL2')
optdepends=('gtk3: graphical interface')
makedepends=('ocaml>=4.11.0' 'emacs' 'lablgtk3')
source=("https://github.com/bcpierce00/unison/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        'large.patch'
        'desktop')
sha512sums=('f3fafd5e1a2950a00ed8bcc682036180ea40eff1ccfa1fc671cca49954890a535ee48faf1e8e62002563143e5479b9df1eca1db1caf03dffc50449fb467b8e2b'
            'e2f7a5e6e832ee9c694f36e399178652456d2047b22cba86603982cd6f6caf54e520fc87a8bde1940b2da46102cf3aa89f3e062c965efc77cd840b47e01b4d2f'
            '2043acd79dde45b9b724076e361f117a6b42ec0c0321a2d2836b55a7fe5b03c45d81200819f64bc3e7d446f979a5a4a66c3d8c3ac7bdf1fe469c480ae2ac9464')
options=('!makeflags')

prepare() {
	cd ${pkgname}-${pkgver}
	patch -p0 -i ../large.patch
}

build() {
	cd ${pkgname}-${pkgver}
	for ui in gtk3 text; do
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
	cd ${pkgname}-${pkgver}
	install -d "${pkgdir}"/usr/bin
	install -m755 unison-* "${pkgdir}"/usr/bin
	ln -s unison-text "${pkgdir}"/usr/bin/unison

	install -Dm644 ../desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 icons/U.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
	for i in 16 24 32 48 256; do
		install -Dm644 icons/U.${i}x${i}x16m.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
	done
}
