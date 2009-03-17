# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline
pkgver=5.2.013
pkgrel=2
pkgdesc="GNU readline library"
arch=(i686 x86_64)
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
groups=('base')
depends=('glibc' 'ncurses')
backup=("etc/inputrc")
install=readline.install
source=(#ftp://ftp.cwru.edu/pub/bash/readline-${pkgver}.tar.gz
	http://www.sfr-fresh.com/unix/misc/readline-${pkgver}.tar.gz
	inputrc)
md5sums=('07666d8dabefdfc7fb328b14cd6ce843'
         'e5fc955f56d9fa5beb871f3279b8fa8b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make SHLIB_LIBS=-lncurses || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  
  mkdir -p ${startdir}/pkg/etc
  install -m644 ../inputrc ${startdir}/pkg/etc/inputrc || return 1

  cd ${startdir}/pkg
  mkdir -pv lib
  mv -v usr/lib/lib{readline,history}.so.5* lib/ || return 1
  ln -svf ../../lib/libreadline.so.5 usr/lib/libreadline.so || return 1
  ln -svf ../../lib/libhistory.so.5 usr/lib/libhistory.so || return 1
  
  rm -f ${pkgdir}/usr/share/info/dir
}
