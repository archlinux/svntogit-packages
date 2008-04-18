# $Id$
# Maintainer: Pierre Schmitz <pierre@zeroflux.de>
pkgname=apache
pkgver=2.2.8
pkgrel=2
pkgdesc="A high performance Unix-based HTTP server (with SSL)"
arch=('i686' 'x86_64')
options=('!libtool')
url='http://www.apache.org/dist/httpd'
license=('APACHE')
install=apache.install
backup=(etc/httpd/conf/httpd.conf home/httpd/html/index.html
        etc/httpd/conf/extra/httpd-{autoindex,dav,default,info,languages}.conf
        etc/httpd/conf/extra/httpd-{manual,mpm,multilang-errordoc}.conf
        etc/httpd/conf/extra/httpd-{ssl,userdir,vhosts}.conf)
depends=('openssl>=0.9.8b' 'zlib' 'apr-util>=1.2.12' 'db>=4.6' 'pcre')
source=(http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2
        httpd index.html mod_ssl.txt httpd.logrotate httpd.conf)
md5sums=('76d2598a4797163d07cd50e5304aa7cd' '6016e08d7465fc1617db2f94f58eb31b'\
         'e9b572e426f6b6a4b6458993c23689c7' '68725783a63014506218d5870cc099b4'\
         'a13925eef67108cf22f6bd1b2b8decb1' '9bc1ece8bb40a78c1c75dba0cde3d83b')

build() {
	cd ${startdir}/src/httpd-${pkgver}
	# fix the suexec user
	sed -i 's|^#define AP_HTTPD_USER.*$|#define AP_HTTPD_USER "nobody"|' \
	support/suexec.h
	./configure --prefix=/usr --enable-layout=RedHat --datadir=/home/httpd \
	--enable-modules=all --enable-mods-shared=all --enable-ssl --enable-so \
	--enable-proxy --enable-proxy-connect --enable-proxy-ftp \
	--enable-proxy-http --enable-suexec --enable-dbd \
	--enable-cache --enable-disk-cache --enable-mem-cache \
	--with-apr=/usr --with-apr-util=/usr --with-pcre=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install
	rm -f ${startdir}/pkg/usr/include/fnmatch.h
	rm -rf ${startdir}/pkg/home/httpd/html/* ${startdir}/pkg/home/httpd/manual
	install -D -m755 ../httpd ${startdir}/pkg/etc/rc.d/httpd
	install -D -m644 ../httpd.logrotate ${startdir}/pkg/etc/logrotate.d/httpd
	install -D -m644 ../index.html ${startdir}/pkg/home/httpd/html/index.html
	install -D -m644 ../mod_ssl.txt ${startdir}/pkg/etc/httpd/conf/mod_ssl.txt
	install -D -m644 ../httpd.conf ${startdir}/pkg/etc/httpd/conf/httpd.conf

	# move suexec to the right place
	mv ${startdir}/pkg/usr/sbin/suexec ${startdir}/pkg/usr/bin/suexec
	# copy in extra config files
	mkdir -p ${startdir}/pkg/etc/httpd/conf/extra
	cp docs/conf/extra/*.conf ${startdir}/pkg/etc/httpd/conf/extra/
	# symlinks needed for the ServerRoot setting (/etc/httpd/conf)
	ln -s /usr/lib/apache ${startdir}/pkg/etc/httpd/modules
	ln -s /var/log/httpd ${startdir}/pkg/etc/httpd/logs

	# config change
	sed -i 's|^ServerTokens.*$|ServerTokens Prod|g' \
	${startdir}/pkg/etc/httpd/conf/extra/httpd-default.conf
}