# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=libmysqlclient
pkgver=5.0.51
pkgrel=2
pkgdesc="MySQL client libraries"
arch=(i686 x86_64)
depends=('openssl' 'zlib')
makedepends=('gcc' 'readline' 'tcp_wrappers' 'libtool')
options=('!libtool')
license=('GPL')
url=('http://www.mysql.com/')
source=(ftp://mirror.services.wisc.edu/mirrors/mysql/Downloads/MySQL-5.0/mysql-${pkgver}a.tar.gz)

build() {
  # PIC
  export CFLAGS="-fPIC ${CFLAGS}"
  cd $startdir/src/mysql-${pkgver}a
  libtoolize --force
  ./configure --prefix=/usr --libexecdir=/usr/sbin \
    --localstatedir=/var --sysconfdir=/etc \
    --without-debug --without-docs --without-bench --without-readline \
    --with-innodb --enable-local-infile --with-openssl \
    --with-charset=latin1 --with-collation=latin1_general_ci \
    --with-extra-charsets=complex --enable-thread-safe-client \
    --with-libwrap --with-berkeley-db

  for dir in include strings regex mysys dbug extra; do
    pushd ${dir} || return 1
    make || return 1
    popd
  done
  for dir in libmysql libmysql_r; do
    pushd ${dir} || return 1
    make link_sources
    make || return 1
    make DESTDIR=${startdir}/pkg install
    popd
  done
  cd include
  make DESTDIR=${startdir}/pkg install

  cd ../scripts
  make mysql_config
  mkdir -p ${startdir}/pkg/usr/bin
  install -m755 mysql_config ${startdir}/pkg/usr/bin
  
  # create library symlinks in /usr/lib
  ln -sf mysql/libmysqlclient.so.15 $startdir/pkg/usr/lib/libmysqlclient.so.15
  ln -sf libmysqlclient.so.15 $startdir/pkg/usr/lib/libmysqlclient.so
  ln -sf libmysqlclient.so.15 $startdir/pkg/usr/lib/libmysqlclient.so.1
  ln -sf mysql/libmysqlclient_r.so.15 $startdir/pkg/usr/lib/libmysqlclient_r.so.15
  ln -sf libmysqlclient_r.so.15 $startdir/pkg/usr/lib/libmysqlclient_r.so
  ln -sf libmysqlclient_r.so.15 $startdir/pkg/usr/lib/libmysqlclient_r.so.1
}
md5sums=('a83dbdbb91267daf73d2297a9c283dd1')
