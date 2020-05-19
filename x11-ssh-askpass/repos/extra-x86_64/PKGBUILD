# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Charles Mauch <cmauch@gmail.com>

pkgname=x11-ssh-askpass
pkgver=1.2.4.1
pkgrel=7
pkgdesc='Lightweight passphrase dialog for SSH'
url='http://www.jmknoble.net/software/x11-ssh-askpass/'
license=('custom')
arch=('x86_64')
depends=('libxt')
makedepends=('imake')
#source=("${url}${pkgname}-${pkgver}.tar.gz" # httpd only sends half the bits
source=("https://pkgs.fedoraproject.org/repo/pkgs/openssh/x11-ssh-askpass-1.2.4.1.tar.gz/8f2e41f3f7eaa8543a2440454637f3c3/x11-ssh-askpass-1.2.4.1.tar.gz")
sha256sums=('620de3c32ae72185a2c9aeaec03af24242b9621964e38eb625afb6cdb30b8c88')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure \
		--mandir=/usr/share/man \
		--libexecdir=/usr/lib/ssh \
		--with-app-defaults-dir=/usr/share/X11/app-defaults \

	xmkmf
	make includes
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install install.man
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	sed '109,174p;d' README > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
