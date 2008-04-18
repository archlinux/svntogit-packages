# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libpqxx
pkgver=2.6.9
pkgrel=1
pkgdesc="C++ client API for PostgreSQL"
arch=('i686' 'x86_64')
license=('custom')
url="http://pqxx.org/development/libpqxx/"
source=("http://pqxx.org/download/software/libpqxx/libpqxx-$pkgver.tar.gz")
options=('!libtool')
depends=('gcc' 'postgresql-libs>=8.2.3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-shared
  make || return 1
  make prefix=$startdir/pkg/usr install 
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  
}

