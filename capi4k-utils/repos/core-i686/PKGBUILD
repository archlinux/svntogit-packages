# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=capi4k-utils
pkgver=050718
pkgrel=6
pkgdesc="capi utils for isdn cards"
arch=(i686 x86_64)
license=('GPL2')
url="ftp://ftp.in-berlin.de/pub/capi4linux/"
makedepends=('ppp')
depends=('glibc' 'bash')
backup=(etc/capi.conf)
source=(ftp://ftp.in-berlin.de/pub/capi4linux/capi4k-utils-2005-07-18.tar.gz ppp-2.4.4.patch config capi.conf capiinit.rc
	capi-compile.patch)
options=(!libtool)
md5sums=('c745759b6b3d64e19763727176648cdf' 'c5416b8b1b76a82c4bcaad76140369e1'\
         '030918cda22b07a3af9215c38117538e' 'c88940f0ace5759b7a0e8b267ca77ce2'\
         'aa59439a70299290a4d9bcdfaeafed72')

build() {
  cd $startdir/src/$pkgname
  patch -Np1 -i ../ppp-2.4.4.patch || return 1
  # fix compiling with gcc 4.2
  patch -Np1 -i ../capi-compile.patch || return 1

  cp ../config .config
  # fix pppd plugin
  sed -i -e 's/2.3.11 2.4.0 2.4.1 2.4.1b1 2.4.1b2 2.4.2b3 2.4.2 2.4.3/2.4.4/g' $startdir/src/$pkgname/pppdcapiplugin/Makefile
  # Arch64 fix from Gentoo
  # patch capi20/Makefile.* to use -fPIC for shared library
  [ "$CARCH" = "x86_64" ] &&  (sed -i -e "s:^\(CFLAGS.*\):\1 -fPIC:g" capi20/Makefile.* || return 1)

  cd capi20
  aclocal
  cd $startdir/src/$pkgname
  make subconfig || return 1
  make || return 1
  make DESTDIR=$startdir/pkg/ install || return 1
  install -m755 -D $startdir/src/capiinit.rc $startdir/pkg/etc/rc.d/capiinit
  install -m644 $startdir/src/capi.conf $startdir/pkg/etc
  cd $startdir/pkg/usr/lib
  ln -s libcapi20 libcapi20.so.2
  # fix wrong manpage permission
  chmod 644 $startdir/pkg/usr/man/man8/capiplugin.8
}
