# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=nagios-nrpe
pkgver=2.11
pkgrel=1
pkgdesc="Daemon to answer plugin requests from Nagios on remote hosts."
arch=(i686 x86_64)
license=('GPL')
# tcpwrappers are optional
depends=(openssl)
options=(!libtool)
install="$pkgname.install"
backup=(etc/nrpe/nrpe.cfg)
url="http://www.nagios.org/"
source=(http://dl.sourceforge.net/sourceforge/nagios/nrpe-$pkgver.tar.gz 
	rc.nrpe)
md5sums=('dcf3b7c5b7c94c0ba6cbb4999c1161f0'
         '8be4e2d5869cf7866a6a26427b71824d')

build() {
	cd $startdir/src/nrpe-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc/nrpe \
		--with-nrpe-user=nrpe --with-nrpe-group=nrpe
	make || return 1
	
	# comment out default samples as they won't work and may lessen security
	sed -i 's/^command/#command/' sample-config/nrpe.cfg || return 1

	install -D -m644 sample-config/nrpe.cfg $startdir/pkg/etc/nrpe/nrpe.cfg || return 1
	install -D -m755 src/nrpe $startdir/pkg/usr/sbin/nrpe || return 1
	install -D -m755 $startdir/src/rc.nrpe $startdir/pkg/etc/rc.d/nrpe || return 1 
}
