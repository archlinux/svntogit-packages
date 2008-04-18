# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
pkgname=php
pkgver=5.2.5
pkgrel=11
_suhosinver=0.9.6.2
pkgdesc='A high-level scripting language'
arch=('i686' 'x86_64')
license=('PHP')
url='http://www.php.net'
backup=('etc/php/php.ini')
install=php.install
depends=('glibc' 'readline' 'ncurses' 'libxml2' 'pcre')
makedepends=('apache' 'imap' 'postgresql-libs' 'mysql' 'libldap' 'smtp-server' \
             'libpng' 'libjpeg' 'sqlite3' 'unixodbc' 'net-snmp' \
             'libmcrypt' 'tidyhtml' 'aspell' 'libtool' 'freetype2' 'libjpeg' \
             'curl' 'libxslt' 'pam' 'openssl' 'bzip2' 'gdbm')
optdepends=('bzip2: bz2' \
            'curl: curl' \
            'gdbm: dba' \
            'libpng: gd' \
            'libjpeg: gd' \
            'freetype2: gd' \
            'pam: imap' \
            'libldap: ldap' \
            'mcrypt: mcrypt' \
            'libtool: mcrypt' \
            'libmysqlclient: mysql/mysqli' \
            'unixodbc: odbc/pdo_odbc' \
            'openssl: openssl' \
            'postgresql-libs: pgsql/pdo_pgsql' \
            'aspell: pspell' \
            'net-snmp: snmp' \
            'sqlite3: sqlite' \
            'tidyhtml: tidy' \
            'libxslt: xsl' \
            )
options=('emptydirs' '!makeflags')
source=("http://www.php.net/distributions/${pkgname}-${pkgver}.tar.bz2" \
        "http://www.hardened-php.net/suhosin/_media/suhosin-patch-${pkgver}-${_suhosinver}.patch.gz" \
        'php.ini' \
        'CVE-2008-0599.patch')
md5sums=('1fe14ca892460b09f06729941a1bb605' \
         'a43f1a0ee9e7c41c4cb6890174f1f9d8' \
         '7cb9c272fb373ee431f4a808952e0bef' \
         'ba28bf5e7aeaefa7d7e328eecd30207c')

build() {
	[ -e /usr/lib/libdb-4.1.so ] && echo 'remove db4.1 package' && return 1

	phpconfig="--prefix=/usr \
	--sysconfdir=/etc/php \
	--with-layout=GNU \
	--with-config-file-path=/etc/php \
	--with-config-file-scan-dir=/etc/php/conf.d \
	--enable-inline-optimization \
	--disable-debug \
	--disable-rpath \
	--disable-static \
	--enable-shared \
	"

	phpextensions="--with-openssl=shared \
	--with-zlib=shared \
	--enable-bcmath=shared \
	--with-bz2=shared \
	--enable-calendar=shared \
	--with-curl=shared \
	--enable-dba=shared \
	--without-db2 \
	--without-db3 \
	--with-db4=shared \
	--with-gdbm=shared \
	--enable-dbase=shared \
	--enable-exif=shared \
	--enable-ftp=shared \
	--with-gd=shared \
	--enable-gd-native-ttf \
	--with-jpeg-dir=shared,/usr \
	--with-png-dir=shared,/usr \
	--with-gettext=shared \
	--with-imap=shared \
	--with-imap-ssl=shared \
	--with-ldap=shared \
	--enable-mbstring=shared \
	--with-mcrypt=shared \
	--with-mysql=shared \
	--with-mysql-sock=/tmp/mysql.sock \
	--with-mysql=shared \
	--with-mysqli=shared \
	--with-ncurses=shared \
	--with-unixODBC=shared,/usr \
	--enable-pdo=shared \
	--with-pdo-mysql=shared \
	--with-pdo-sqlite=shared \
	--with-pdo-odbc=shared,unixODBC,/usr \
	--with-pdo-pgsql=shared \
	--with-sqlite=shared \
	--with-pgsql=shared \
	--enable-shmop=shared \
	--with-snmp=shared \
	--enable-soap=shared \
	--enable-sqlite-utf8=shared \
	--enable-sysvmsg=shared \
	--enable-sysvsem=shared \
	--enable-sysvshm=shared \
	--with-tidy=shared \
	--with-xsl=shared \
	--enable-zip=shared \
	--enable-posix=shared \
	--enable-sockets=shared \
	--enable-xml \
	--with-ttf=shared \
	--enable-session=shared \
	--with-regex=php \
	--with-pcre-regex=/usr \
	--enable-mbstring=all \
	--enable-mbregex \
	--enable-json=shared \
	--with-iconv=shared \
	--with-xmlrpc=shared \
	--with-pspell=shared \
	--with-freetype-dir=shared,/usr \
	--with-mime-magic=shared \
	"

	cd ${startdir}/src/${pkgname}-${pkgver}

	# fix security issue CVE-2008-0599
	patch -p0 -i ${startdir}/src/CVE-2008-0599.patch || return 1

	# apply suhosin patch
	patch -p1 -i ${startdir}/src/suhosin-patch-${pkgver}-${_suhosinver}.patch || return 1

	# cli
	./configure ${phpconfig} \
		--disable-cgi \
		--with-readline \
		--enable-pcntl \
		--with-pear=/usr/share/pear \
		${phpextensions} || return 1
	make || return 1
	# make test
	make INSTALL_ROOT=${startdir}/pkg install || return 1

	# fix pear path
	sed "s|$PWD||g" -i ${startdir}/pkg/usr/{bin/pear,share/pear/pearcmd.php}
	# cleanup
	rm -f ${startdir}/pkg`${startdir}/pkg/usr/bin/php-config --extension-dir`/*.a
	rm -rf ${startdir}/pkg/{.registry,.channels,.depdb*,.lock,.filemap}
	rmdir ${startdir}/pkg/usr/include/php/include
	# install php.ini
	install -D -m644 ${startdir}/src/php.ini ${startdir}/pkg/etc/php/php.ini
	install -d -m755 ${startdir}/pkg/etc/php/conf.d/

	# cgi and fcgi
	./configure ${phpconfig} \
		--enable-fastcgi \
		--enable-cgi \
		--enable-discard-path \
		--enable-force-cgi-redirect \
		--disable-cli \
		${phpextensions} || return 1
	make || return 1
	install -D -m755 sapi/cgi/php-cgi ${startdir}/pkg/usr/bin/php-cgi || return 1

	# mod_php
	./configure ${phpconfig} \
		--with-apxs2 \
		--disable-cli \
		${phpextensions} || return 1
	make || return 1
	install -D -m644 libs/libphp5.so ${startdir}/pkg/usr/lib/apache/libphp5.so || return 1
}
