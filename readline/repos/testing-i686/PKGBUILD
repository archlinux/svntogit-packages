# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline
_basever=6.3
_patchlevel=000 #prepare for some patches
pkgver=$_basever #.$_patchlevel
pkgrel=2
pkgdesc="GNU readline library"
arch=('i686' 'x86_64')
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
depends=('glibc' 'ncurses')
backup=('etc/inputrc')
options=('!emptydirs')
install=readline.install
source=(http://ftp.gnu.org/gnu/readline/readline-$_basever.tar.gz{,.sig}
        inputrc
        readline-6.3-vi-last.patch)
if [ $_patchlevel -gt 00 ]; then
    for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-$_basever-patches/readline${_basever//./}-$(printf "%03d" $p){,.sig})
    done
fi
md5sums=('33c8fb279e981274f485fd91da77e94a'
         'SKIP'
         '58d54966c1191db45973cb3191ac621a'
         'fcfe0a50c69f56f66ad04127a927862e')

preapre() {
  cd ${srcdir}/${pkgname}-$_basever
  for (( p=1; p<=$((10#${_patchlevel})); p++ )); do
    msg "applying patch readline${_basever//./}-$(printf "%03d" $p)"
    patch -p0 -i $srcdir/readline${_basever//./}-$(printf "%03d" $p)
  done

  # patch from upstream mailing list to fix vi mode
  patch -p2 -i $srcdir/readline-6.3-vi-last.patch

  # Remove RPATH from shared objects (FS#14366)
  sed -i 's|-Wl,-rpath,$(libdir) ||g' support/shobj-conf
}

build() {
  cd ${srcdir}/${pkgname}-$_basever

  # build with -fPIC for x86_64 (FS#15634)
  [[ $CARCH == "x86_64" ]] && CFLAGS="$CFLAGS -fPIC"

  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses
}

package() {
  cd ${srcdir}/${pkgname}-$_basever
  make DESTDIR=${pkgdir} install
  
  install -Dm644 ${srcdir}/inputrc ${pkgdir}/etc/inputrc
}
