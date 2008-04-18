# $Id$
# Maintainer: eric <eric@archlinux.org>
# Committer: Manolis Tzanidakis
#

pkgname=bglibs
pkgver=1.102
pkgrel=1
pkgdesc="BG Libraries Collection"
arch=(i686 x86_64)
url="http://untroubled.org/bglibs"
depends=('glibc')
source=($url/$pkgname-$pkgver.tar.gz)
md5sums=('0615125e33abe30ecd50e63bcd43aa72')

build() {
  cd $startdir/src/$pkgname-$pkgver
  /bin/echo "/usr/lib/bglibs/include" > conf-include
  /bin/echo "/usr/lib/bglibs/lib" > conf-lib
  /bin/echo "/usr/bin" > conf-bin
  /bin/echo "/usr/man" > conf-man
  /bin/echo "gcc $CFLAGS" > conf-cc
  /bin/echo "gcc $LDFLAGS" > conf-ld
  /usr/bin/make || return 1
  /bin/mkdir -p $startdir/pkg/usr/lib/bglibs
  install_prefix=$startdir/pkg make install || return 1
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
# vim: ts=2 sw=2 et ft=sh
