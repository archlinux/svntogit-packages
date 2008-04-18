# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=qof
pkgver=0.6.4
pkgrel=2
pkgdesc="Provides a set of C Language utilities for performing generic structured complex queries"
arch=('i686' 'x86_64')
url="http://qof.sourceforge.net"
license=('GPL')
depends=('glib2' 'libxslt' 'libxml2>=2.5.10' 'libgda')
source=(http://downloads.sourceforge.net/qof/qof-$pkgver.tar.gz)
md5sums=('555787c7ea06a3412ff9119fe4127886')
options=('!libtool')

build() {
  cd $startdir/src/qof-$pkgver
  sed -i 's/-Werror//' configure qof/test/Makefile.in || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
