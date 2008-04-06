# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Sergej Pupykin <ps@lx-ltd.ru>

pkgname=ulogd
pkgver=1.24
pkgrel=4
pkgdesc="Userspace Packet Logging for netfilter"
arch=(i686 x86_64)
url="http://www.netfilter.org/projects/ulogd/index.html"
depends=()
makedepends=('mysql' 'postgresql>=8.2.3' 'sqlite3' 'libpcap>=0.9.8')
backup=(etc/ulogd.conf)
source=(ftp://ftp.netfilter.org/pub/ulogd/ulogd-1.24.tar.bz2 ulogd)
md5sums=(05b4ed2926b9a22aaeaf642917bbf8ff 99fd661b5e689a25e0d6323fb3591d9e)

build() {
	export MAKEFLAGS="-j1"
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc --with-mysql \
		--with-pgsql --with-sqlite3
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
	install -D -m755 $startdir/src/ulogd $startdir/pkg/etc/rc.d/ulogd
	mkdir -p $startdir/pkg/usr/share/ulogd
	install -m644 doc/*.table $startdir/pkg/usr/share/ulogd
}
