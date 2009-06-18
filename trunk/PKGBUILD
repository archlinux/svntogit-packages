# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=readline
_patchlevel=00 #prepare for some patches
pkgver=6.0.$_patchlevel
pkgrel=1
pkgdesc="GNU readline library"
arch=(i686 x86_64)
url="http://tiswww.case.edu/php/chet/readline/rltop.html"
license=('GPL')
groups=('base')
depends=('glibc' 'ncurses')
backup=("etc/inputrc")
source=(http://ftp.gnu.org/gnu/readline/readline-6.0.tar.gz
        inputrc)
if [ $_patchlevel -gt 00 ]; then
    for p in $(seq -w 01 $_patchlevel); do
        source=(${source[@]} http://ftp.gnu.org/gnu/readline/readline-6.0-patches/readline60-$p)
    done
fi
md5sums=('b7f65a48add447693be6e86f04a63019'
         'e5fc955f56d9fa5beb871f3279b8fa8b')

build() {
  cd ${startdir}/src/${pkgname}-6.0
  for p in ../readline60-*; do
    [ -e "$p" ] || continue
    msg "applying patch ${p}"
    patch -Np0 -i ${p} || return 1
  done

  ./configure --prefix=/usr --libdir=/lib \
        --mandir=/usr/share/man --infodir=/usr/share/info
  make SHLIB_LIBS=-lncurses || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  
  mkdir -p ${startdir}/pkg/etc
  install -m644 ../inputrc ${startdir}/pkg/etc/inputrc || return 1

  rm -f ${pkgdir}/usr/share/info/dir
}
