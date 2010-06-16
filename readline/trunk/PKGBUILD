# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline
_patchlevel=002 #prepare for some patches
pkgver=6.1.$_patchlevel
pkgrel=1
pkgdesc="GNU readline library"
arch=(i686 x86_64)
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('glibc' 'ncurses')
backup=("etc/inputrc")
source=(http://ftp.gnu.org/gnu/readline/readline-6.1.tar.gz
        inputrc)
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$_patchlevel; p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-6.1-patches/readline61-$(printf "%03d" $p))
    done
fi
md5sums=('fc2f7e714fe792db1ce6ddc4c9fb4ef3'
         'e5fc955f56d9fa5beb871f3279b8fa8b'
         'c642f2e84d820884b0bf9fd176bc6c3f'
         '1a76781a1ea734e831588285db7ec9b1')

build() {
  cd ${srcdir}/${pkgname}-6.1
  for p in ../readline61-*; do
    [ -e "$p" ] || continue
    msg "applying patch ${p}"
    patch -Np0 -i ${p} || return 1
  done

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf

  # build with -fPIC for x86_64 (FS#15634)
  [ $CARCH == "x86_64" ] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr --libdir=/lib \
        --mandir=/usr/share/man --infodir=/usr/share/info
  make SHLIB_LIBS=-lncurses || return 1
  make DESTDIR=${pkgdir} install || return 1
  
  mkdir -p ${pkgdir}/etc
  install -m644 ../inputrc ${pkgdir}/etc/inputrc || return 1
  #FHS recommends only shared libs in /lib
  mkdir -p $pkgdir/usr/lib
  mv $pkgdir/lib/*.a $pkgdir/usr/lib

  # to make the linker find the shared lib and fix compile issues
  cd ${pkgdir}/usr/lib
  ln -sv /lib/libreadline.so .
  ln -sv /lib/libhistory.so .
}
