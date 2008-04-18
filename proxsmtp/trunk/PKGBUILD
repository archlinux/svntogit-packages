# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
pkgname=proxsmtp
pkgver=1.7
pkgrel=1
pkgdesc="A Flexible SMTP filter that allows you to reject, change, or log email based on arbitrary critiera."
arch=(i686 x86_64)
license=('custom')
depends=('smtp-server')
backup=(etc/proxsmtpd.conf)
url="http://memberwebs.com/nielsen/software/$pkgname/"
source=(http://memberwebs.com/nielsen/software/$pkgname/$pkgname-$pkgver.tar.gz rc.proxsmtpd)
md5sums=('de6ce4a743b45cf84c4dbaccda9ee147'
         '631599c0ed60b0afd6f558aaaefff750')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc
	make
	make DESTDIR=$startdir/pkg install
	install -D -m644 doc/proxsmtpd.conf $startdir/pkg/etc/proxsmtpd.conf
	sed -i 's/#User: nobody/User: nobody/' $startdir/pkg/etc/proxsmtpd.conf
	install -D -m755 $startdir/src/rc.proxsmtpd $startdir/pkg/etc/rc.d/proxsmtpd
	mkdir -m 755 -p $startdir/pkg/var/run/proxsmtpd
	chown nobody.nobody $startdir/pkg/var/run/proxsmtpd

	install -Dm644 $startdir/src/$pkgname-$pkgver/COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
