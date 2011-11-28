# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=openssh
pkgver=5.9p1
pkgrel=5
pkgdesc='Free version of the SSH connectivity tools'
arch=('i686' 'x86_64')
license=('custom:BSD')
url='http://www.openssh.org/portable.html'
backup=('etc/ssh/ssh_config' 'etc/ssh/sshd_config' 'etc/pam.d/sshd' 'etc/conf.d/sshd')
depends=('krb5' 'openssl' 'libedit')
optdepends=('x11-ssh-askpass: input passphrase in X without a terminal')
source=("ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/${pkgname}-${pkgver}.tar.gz"
        'sshd.confd'
        'sshd.pam'
        'sshd')
sha1sums=('ac4e0055421e9543f0af5da607a72cf5922dcc56'
          'ec102deb69cad7d14f406289d2fc11fee6eddbdd'
          '3413909fd45a28701c92e6e5b59c6b65346ddb0f'
          '21fa88de6cc1c7912e71655f50896ba17991a1c2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/ssh \
		--sysconfdir=/etc/ssh \
		--with-privsep-user=nobody \
		--with-md5-passwords \
		--with-pam \
		--with-mantype=man \
		--with-xauth=/usr/bin/xauth \
		--with-kerberos5=/usr \
		--with-ssl-engine \
		--with-libedit=/usr/lib \
		--disable-strip # stripping is done by makepkg

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	install -Dm755 ../sshd "${pkgdir}"/etc/rc.d/sshd
	install -Dm644 ../sshd.pam "${pkgdir}"/etc/pam.d/sshd
	install -Dm644 ../sshd.confd "${pkgdir}"/etc/conf.d/sshd
	install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"

	rm "${pkgdir}"/usr/share/man/man1/slogin.1
	ln -sf ssh.1.gz "${pkgdir}"/usr/share/man/man1/slogin.1.gz

	# additional contrib scripts that we like
	install -Dm755 contrib/findssl.sh "${pkgdir}"/usr/bin/findssl.sh
	install -Dm755 contrib/ssh-copy-id "${pkgdir}"/usr/bin/ssh-copy-id
	install -Dm644 contrib/ssh-copy-id.1 "${pkgdir}"/usr/share/man/man1/ssh-copy-id.1

	# PAM is a common, standard feature to have
	sed \
		-e '/^#ChallengeResponseAuthentication yes$/c ChallengeResponseAuthentication no' \
		-e '/^#UsePAM no$/c UsePAM yes' \
		-i "${pkgdir}"/etc/ssh/sshd_config
}
