# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=gdb
pkgver=6.7.1
pkgrel=1
pkgdesc="The GNU Debugger"
arch=(i686 x86_64)
depends=('ncurses' 'expat')
options=('!libtool')
license=('GPL3')
source=(http://ftp.gnu.org/gnu/gdb/${pkgname}-${pkgver}.tar.bz2)
url="http://sources.redhat.com/gdb/"
md5sums=('30a6bf36eded4ae5a152d7d71b86dc14')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-nls
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  # resolve conflicts with binutils
  rm -f ${startdir}/pkg/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f ${startdir}/pkg/usr/lib/{libiberty,libbfd,libopcodes}.a
}
