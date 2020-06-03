# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=gnupg
pkgver=2.2.20
pkgrel=3
pkgdesc='Complete and free implementation of the OpenPGP standard'
url='https://www.gnupg.org/'
license=('GPL')
arch=('x86_64')
checkdepends=('openssh')
makedepends=('libldap' 'libusb-compat' 'pcsclite')
depends=('npth' 'libgpg-error' 'libgcrypt' 'libksba' 'libassuan'
         'pinentry' 'bzip2' 'readline' 'gnutls' 'sqlite')
optdepends=('libldap: gpg2keys_ldap'
            'libusb-compat: scdaemon'
            'pcsclite: scdaemon')
validpgpkeys=('D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'
              '46CC730865BB5C78EBABADCF04376F3EE0856959'
              '031EC2536E580D8EA286A9F22071B08A33BD3F06'
              '5B80C5754298F0CB55D8ED6ABCEF7E294B092E28')
source=("https://gnupg.org/ftp/gcrypt/${pkgname}/${pkgname}-${pkgver}.tar.bz2"{,.sig}
        'gpg-zip.patch'
        'drop-import-clean.patch'
        'avoid-beta-warning.patch'
        'do-not-rebuild-defsincdate.patch')
sha256sums=('04a7c9d48b74c399168ee8270e548588ddbe52218c337703d7f06373d326ca30'
            'SKIP'
            'ddcd1f125cb2efda187ef8374a7440b491eb9f338db1772af497e50fdd367eb5'
            '02d375f0045f56f7dd82bacdb5ce559afd52ded8b75f6b2673c39ec666e81abc'
            '22fdf9490fad477f225e731c417867d9e7571ac654944e8be63a1fbaccd5c62d'
            '01fee1b04358e5dce76894214bb263e9a75cf408eb1277fad5b751ab3d45b87a')

install=install

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../avoid-beta-warning.patch
	patch -p1 -i ../drop-import-clean.patch
	patch -p1 -i ../gpg-zip.patch

	# improve reproducibility
	patch -p1 -i ../do-not-rebuild-defsincdate.patch
	rm doc/gnupg.info*

	./autogen.sh
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/gnupg \
		--enable-maintainer-mode \
		--enable-symcryptrun \

	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	ln -s gpg "${pkgdir}"/usr/bin/gpg2
	ln -s gpgv "${pkgdir}"/usr/bin/gpgv2

	cd doc/examples/systemd-user
	for i in *.*; do
		install -Dm644 "$i" "${pkgdir}/usr/lib/systemd/user/$i"
	done
}
