# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=zip
pkgver=3.0
_pkgver=${pkgver/./}
pkgrel=10
pkgdesc='Compressor/archiver for creating and modifying zipfiles'
url='http://www.info-zip.org/Zip.html'
arch=('x86_64')
license=('custom')
depends=('bzip2')
source=("https://downloads.sourceforge.net/infozip/${pkgname}${_pkgver}.tar.gz"
        'https://src.fedoraproject.org/rpms/zip/raw/rawhide/f/zip-3.0-currdir.patch'
        'https://src.fedoraproject.org/rpms/zip/raw/rawhide/f/zip-3.0-exec-shield.patch'
        'https://src.fedoraproject.org/rpms/zip/raw/rawhide/f/zip-3.0-format-security.patch'
        'https://src.fedoraproject.org/rpms/zip/raw/rawhide/f/zipnote.patch')
sha256sums=('f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369'
            '44cac3d4e8b447988b6e4eeb4bb6e701110cedfb09ea49eac471011328c8acab'
            '10f0f3756a2415e33edf1455373b322404962b743b3a52a757b669e47dd7f1b2'
            '3759134487afad9c63e2e9693aa05b9dcc67f55a9ef961e82074b587b094292a'
            '89249a3f1fdf838b795ce432a2d763fdbe913d6a146541e41b7a2e2769291ba0')

options=('!makeflags')

prepare() {
	cd "${srcdir}/${pkgname}${_pkgver}"
	sed -e "/^CFLAGS_NOOPT =/s/\$/ $CPPFLAGS $CFLAGS/" -i unix/Makefile
	sed -e "s/^LFLAGS1=''/LFLAGS1=$LDFLAGS/" -i unix/configure
	patch -p1 -i ../zip-3.0-currdir.patch
	patch -p1 -i ../zip-3.0-exec-shield.patch
	patch -p1 -i ../zip-3.0-format-security.patch
	patch -p1 -i ../zipnote.patch
}

build() {
	cd "${srcdir}/${pkgname}${_pkgver}"
	make -f unix/Makefile prefix=/usr generic_gcc
}

package() {
	cd "${srcdir}/${pkgname}${_pkgver}"
	make -f unix/Makefile prefix="${pkgdir}"/usr \
		MANDIR="${pkgdir}"/usr/share/man/man1 \
		install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
