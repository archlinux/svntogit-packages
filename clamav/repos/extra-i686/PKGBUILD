# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>

pkgname=clamav
pkgver=0.92
pkgrel=1
pkgdesc="Anti-virus toolkit for Unix."
arch=(i686 x86_64)
depends=('bzip2' 'zlib' 'gmp' 'curl>=7.16.2' 'perl')
options=(!libtool)
install="$pkgname.install"
license=(GPL)
backup=(etc/clamav/clamav.conf etc/clamav/clamd.conf etc/clamav/freshclam.conf etc/conf.d/clamav)
url="http://www.clamav.net"
source=(http://easynews.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        clamav
	clamav.confd
	clamav.logrotate)
	
build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc/clamav \
		--with-dbdir=/var/lib/clamav --disable-clamav
	# will add clamav user with clamav.install
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

	# make sure conf files get installed, cause make install
	# doesn't do that if clamav is already installed upon building.
	for i in clamd freshclam; do
		install -D -m644 etc/$i.conf $startdir/pkg/etc/clamav/$i.conf
	done
	
	install -D -m644 $startdir/src/clamav.confd $startdir/pkg/etc/conf.d/clamav
	install -D -m755 $startdir/src/clamav $startdir/pkg/etc/rc.d/clamav
	install -D -m644 $startdir/src/clamav.logrotate	$startdir/pkg/etc/logrotate.d/clamav

	# create log dirs/files & fix conf files.
	mkdir -p $startdir/pkg/var/log/clamav/
	mkdir -p $startdir/pkg/var/run/clamav/
	chown 64.root $startdir/pkg/var/log/clamav/
	chown 64.root $startdir/pkg/var/run/clamav/

	sed -i -e "s:\#LogFile /tmp/clamd.log:LogFile /var/log/clamav/clamd.log:" \
		-e "s:\#PidFile /var/run/clamd.pid:PidFile /var/run/clamav/clamd.pid:" \
		-e "s:\#User clamav:User clamav:" \
		-e "s:\#LogTime:LogTime:" \
		-e "s:\#TemporaryDirectory /var/tmp:TemporaryDirectory /tmp:" \
		-e "s:\LocalSocket /tmp/clamd.socket:LocalSocket /var/lib/clamav/clamd.sock:" \
		$startdir/pkg/etc/clamav/clamd.conf || return 1

	sed -i -e "s:\#UpdateLogFile /var/log/freshclam.log:UpdateLogFile /var/log/clamav/freshclam.log:" \
		-e "s:\#NotifyClamd /path/to/clamd.conf$:NotifyClamd /etc/clamav/clamd.conf:" \
		$startdir/pkg/etc/clamav/freshclam.conf || return 1

	# fix perms on virus database directory and un-distribute databases to require freshclam
	rm $startdir/pkg/var/lib/clamav/*.cvd
	chown 64:64 -R $startdir/pkg/var/lib/clamav/

	# install clamdwatch
	cd $startdir/src/$pkgname-$pkgver/contrib/clamdwatch
	tar zxf clamdwatch.tar.gz
	sed -i -e 's@/var/run/clamd.ctl@/var/lib/clamav/clamd.sock@' \
	       -e 's@/var/lock/subsys/clamd@/var/run/clamav/clamd.pid@' \
	       -e 's@mkstemp( "/tmp/clamdwatch-XXXXXXXXXXXXXXXX" );@mkstemp( "/tmp/clamdwatch-XXXXXXXXXXXXXXXX" );\nchmod 0644, "$tempFile";@' clamdwatch || return 1

	install -D -m755 clamdwatch $startdir/pkg/usr/sbin/clamdwatch.pl || return 1
}
md5sums=('e500651858a9187a87025c8a5c23969c'
         '338db2f3fbca9d5747ba635d576d8739'
         'f1fd8e736f808da0487928274f585851'
         'a7a4d527ba80ec9d4811e2264e9fab9e')
