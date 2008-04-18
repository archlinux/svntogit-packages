# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=clisp
pkgver=2.41
pkgrel=2
pkgdesc="ANSI Common Lisp interpreter, compiler and debugger"
arch=('i686' 'x86_64')
license=('GPL')
url="http://clisp.cons.org/"
depends=('readline' 'libsigsegv')
source=(http://dl.sourceforge.net/sourceforge/clisp/clisp-${pkgver}.tar.bz2)
md5sums=('3a7a00e82ebeeb72a75a032f84c36c6c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  unset CFLAGS CXXFLAGS
  ./configure --prefix=/usr --prefix=/usr --with-readline --with-gettext --with-dynamic-ffi src
  cd src
  ./makemake --prefix=/usr --prefix=/usr --with-readline --with-gettext --with-dynamic-ffi > Makefile
  make -j1 || return 1
  sed -i 's,http://www.lisp.org/HyperSpec/,http://www.lispworks.com/reference/HyperSpec/,g' config.lisp
  make -j1 || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
