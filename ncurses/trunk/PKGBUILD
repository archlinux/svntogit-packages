# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=ncurses
pkgver=5.6
pkgrel=6
pkgdesc="A System V Release 4.0 curses emulation library"
arch=(i686 x86_64)
url="http://www.gnu.org/software/ncurses/ncurses.html"
license=('MIT')
groups=('base')
depends=('glibc')
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b6593abe1089d6aab1551c105c9300e3')
options=(!makeflags)

build() {
  cd $startdir/src/$pkgname-$pkgver

  # The chtype/mmask-t settings below are to retain ABI compat
  # with ncurses-5.4 so dont change em !
  # we should test in next update if we can drop it.
if [ "$CARCH" == "x86_64" ]; then
  ./configure --prefix=/usr \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=$startdir/pkg \
     --with-chtype='long' --with-mmask-t='long'
  else 
     ./configure --prefix=/usr \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=$startdir/pkg
fi
  make || return 1
  make install
  mkdir -p $startdir/pkg/lib
  cd $startdir/pkg/usr/lib
  mv libncurses.so.$pkgver ../../lib
  ln -sf ../../lib/libncurses.so.$pkgver libncurses.so.$pkgver
  cd $startdir/pkg/lib
  ln -sf libncurses.so.$pkgver libncurses.so.5
  rm -f $startdir/pkg/lib/libcurses.so

  # build unicode support libs
  cd $startdir/src/$pkgname-$pkgver
  make clean
if [ "$CARCH" == "x86_64" ]; then
  ./configure --prefix=/usr \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=$startdir/pkg --enable-widec \
     --with-chtype='long' --with-mmask-t='long'
  else
  ./configure --prefix=/usr \
     --with-shared --with-normal --without-debug --without-ada \
     --with-install-prefix=$startdir/pkg --enable-widec
fi
  make || return 1
  make install
  
  mkdir $startdir/pkg/usr/include/ncursesw
  ln -sf /usr/include/ncurses.h $startdir/pkg/usr/include/ncursesw
  # fix library for tput, we call it in initscripts!
  cd $startdir/pkg/usr/lib
  mv libncursesw.so.$pkgver ../../lib
  ln -sf ../../lib/libncursesw.so.$pkgver libncursesw.so.$pkgver
  cd $startdir/pkg/lib
  ln -sf libncursesw.so.$pkgver libncursesw.so.5

  # install tput to /bin
  mkdir $startdir/pkg/bin/
  mv $startdir/pkg/usr/bin/tput $startdir/pkg/bin/tput

  # install license, rip it from the readme
  cd $startdir/src/$pkgname-$pkgver
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  grep -B 100 '$Id' README > $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
