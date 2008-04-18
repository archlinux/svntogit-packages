# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
pkgname=apr-util
pkgver=1.2.12
pkgrel=1
pkgdesc="The Apache Portable Runtime"
arch=('i686' 'x86_64')
url="http://apr.apache.org/"
depends=('apr>=1.2.12' 'gdbm' 'expat>=2.0' 'db>=4.6')
options=('!libtool')
license=('APACHE')
source=("http://www.apache.org/dist/apr/apr-util-${pkgver}.tar.bz2")
md5sums=('4ec0474c61113dcb57943916e7f53522')

build() {
  cd ${startdir}/src/apr-util-${pkgver}
  autoheader
  autoconf
  ./configure --prefix=/usr --with-apr=/usr \
    --without-pgsql --without-mysql --without-sqlite2 --without-sqlite3 \
    --with-berkeley-db=/usr --with-gdbm=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
