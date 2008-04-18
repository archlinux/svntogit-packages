# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=bincimap
pkgver=1.2.13
pkgrel=4
pkgdesc="A well designed, modular IMAP server for Maildir."
arch=(i686 x86_64)
license=('GPL')
url="http://www.bincimap.org"
depends=('checkpassword' 'gcc-libs' 'openssl<=0.9.8')
install="$pkgname.install"
backup=(etc/bincimap/bincimap.conf etc/xinetd.d/bincimap \
        etc/xinetd.d/bincimaps var/service/bincimap/run \
				var/service/bincimap/log/run var/service/bincimaps/run \
				var/service/bincimaps/log/run)
source=($url/dl/tarballs/1.2/$pkgname-${pkgver}final.tar.bz2 xinetd.patch
				checkpassword.patch)
md5sums=('6d64d556eb3b786ad727e250f884a432' '3b065480b09cdbef31ceeb93217a99e7'\
         '268e62bcb08cbc0155e00d4f46eb1913')
provides=('imap-server')

build() {
	cd $startdir/src/$pkgname-${pkgver}final
	./configure --prefix=/usr --sysconfdir=/etc/bincimap \
			--localstatedir=/var --with-ssl
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

	# clean up the files
	mkdir -p $startdir/pkg/{usr/lib/bincimap,etc/xinetd.d}
	mv $startdir/pkg/usr/libexec $startdir/pkg/usr/lib/bincimap/scripts
	for i in imap imaps; do
		mv $startdir/pkg/etc/bincimap/xinetd/binc$i \
			$startdir/pkg/etc/xinetd.d/binc$i
	done
	rm -rf $startdir/pkg/etc/bincimap/xinetd
	cd $startdir/pkg
	patch -p1 < $startdir/src/xinetd.patch
	patch -p1 < $startdir/src/checkpassword.patch
}
# vim:ts=2:ft=sh
