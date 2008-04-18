# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Modifications: eliott <eliott@cactuswax.net>
# Originally by klapmuetz

pkgname=lighttpd
pkgver=1.4.19
pkgrel=1
pkgdesc="lighttpd is a secure, fast, compliant and very flexible web-server"
license=('custom')
arch=(i686 x86_64)
url="http://www.lighttpd.net/"
depends=('pcre' 'openssl' 'zlib' 'bzip2' 'attr')
makedepends=('fcgi' 'libmysqlclient' 'libldap' 'lua' 'gdbm' 'libmemcache' 'sqlite3' \
             'libxml2' 'vim' 'pkgconfig')
backup=('etc/lighttpd/lighttpd.conf' 'etc/logrotate.d/lighttpd' \
        'etc/conf.d/lighttpd' 'etc/conf.d/spawn-php' \
        'home/lighttpd/html/index.html')
options=(!libtool emptydirs)
install=$pkgname.install
source=(http://www.lighttpd.net/download/$pkgname-$pkgver.tar.bz2 \
        index.html $pkgname.rc.d $pkgname.conf.d $pkgname.logrotate.d \
        spawn-php.rc.d spawn-php.conf.d tweakconf.vim)
md5sums=('d787374e4e4aaa09d5cfa9ab9d23ad40' '85593eb67b928fec79b1efb3fa3cce84' \
         '6d05e499e47425e99bf809c88bd4969d' '14565fa5d30c60941190ceb32b1b551f' \
         'a8c31344b90328c5b751d965d79c5047' 'a7e25d699422e2cfe2e802414052a1dc' \
         '1ba657b113b7e473fb301631a7e2e1a4' 'ce4ca9773d5698549f9d7216fa59c4ee')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib/lighttpd \
    --with-ldap --with-gdbm --with-lua --with-memcache \
    --with-openssl=/usr/include/openssl \
    --with-kerberos5 \
    --with-mysql=/usr/bin/mysql_config \
    --with-webdav-props --with-webdav-locks \
    --with-attr --without-fam
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

   # install configuration scripts and daemons
  install -Dm644 ../index.html $startdir/pkg/home/lighttpd/html/index.html
  install -Dm755 ../lighttpd.rc.d $startdir/pkg/etc/rc.d/lighttpd
  install -Dm644 ../lighttpd.conf.d $startdir/pkg/etc/conf.d/lighttpd
  install -Dm644 ../lighttpd.logrotate.d $startdir/pkg/etc/logrotate.d/lighttpd
  install -Dm755 ../spawn-php.rc.d $startdir/pkg/etc/rc.d/spawn-php
  install -Dm644 ../spawn-php.conf.d $startdir/pkg/etc/conf.d/spawn-php
  install -dm755 -g nobody -o nobody $startdir/pkg/var/run/lighttpd/

   # show some mercy on docfiles
  mkdir -p $startdir/pkg/usr/share/lighttpd
  install -m644 doc/*.txt $startdir/pkg/usr/share/lighttpd

  install -Dm644 doc/lighttpd.conf $startdir/pkg/etc/lighttpd/lighttpd.conf
  ex $startdir/pkg/etc/lighttpd/lighttpd.conf < $startdir/src/tweakconf.vim
  install -D -m 0644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
