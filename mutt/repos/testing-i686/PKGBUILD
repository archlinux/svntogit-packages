# $Id$
# Maintainer: tobias [tobias [at] archlinux.org]

pkgname=mutt
pkgver=1.5.21
pkgrel=2
pkgdesc='Small but very powerful text-based mail client'
url='http://www.mutt.org/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('gpgme' 'ncurses' 'openssl' 'libsasl' 'gdbm' 'libidn' 'mime-types')
source=("ftp://ftp.mutt.org/mutt/devel/${pkgname}-${pkgver}.tar.gz")
sha1sums=('a8475f2618ce5d5d33bff85c0affdf21ab1d76b9')

install=install

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-gpgme \
		--enable-pop \
		--enable-imap \
		--enable-smtp \
		--enable-hcache \
		--with-curses=/usr \
		--with-regex \
		--with-ssl=/usr \
		--with-sasl \
		--with-idn \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	rm "${pkgdir}"/usr/bin/{flea,muttbug}
	rm "${pkgdir}"/usr/share/man/man1/{flea,muttbug}.1
	rm "${pkgdir}"/etc/mime.types{,.dist}
	install -Dm644 contrib/gpg.rc "${pkgdir}"/etc/Muttrc.gpg.dist
}
