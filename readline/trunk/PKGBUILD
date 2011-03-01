# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline
_basever=6.2
_patchlevel=001 #prepare for some patches
pkgver=$_basever.$_patchlevel
pkgrel=1
pkgdesc="GNU readline library"
arch=('i686' 'x86_64')
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('glibc' 'ncurses')
backup=('etc/inputrc')
source=(http://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz
        inputrc)
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p))
    done
fi
md5sums=('67948acb2ca081f23359d0256e9a271c'
         '58d54966c1191db45973cb3191ac621a'
         '83287d52a482f790dfb30ec0a8746669')

build() {
  cd ${srcdir}/${pkgname}-$_basever
  for p in ../readline${_basever//./}-*; do
    [ -e "$p" ] || continue
    msg "applying patch ${p}"
    patch -Np0 -i ${p}
  done

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

  # build with -fPIC for x86_64 (FS#15634)
  [ $CARCH == "x86_64" ] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr --libdir=/lib
  make SHLIB_LIBS=-lncurses
}

package() {
  cd ${srcdir}/${pkgname}-$_basever
  make DESTDIR=${pkgdir} install
  
  install -Dm644 ${srcdir}/inputrc ${pkgdir}/etc/inputrc

  # FHS recommends only shared libs in /lib
  install -dm755 $pkgdir/usr/lib
  mv $pkgdir/lib/*.a $pkgdir/usr/lib

  # to make the linker find the shared lib and fix compile issues
  cd ${pkgdir}/usr/lib
  ln -sv /lib/libreadline.so .
  ln -sv /lib/libhistory.so .
}
