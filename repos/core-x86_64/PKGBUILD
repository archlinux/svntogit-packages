# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=popt
pkgver=1.10.6
pkgrel=3
_rpmver=4.4.6
pkgdesc="A commandline option parser"
arch=(i686 x86_64) 
url="http://rpm.net.in/mirror/rpm-4.4.x/"
license=('GPL' 'MIT')
groups=('base')
depends=('glibc')
options=('!libtool')
source=(http://rpm.net.in/mirror/rpm-4.4.x/rpm-${_rpmver}.tar.gz)
md5sums=('baa6f371446c65b4080d1cd1f194a7ae')

build() {
  cd $startdir/src/rpm-${_rpmver}/popt
  if [ "$CARCH" = "x86_64" ]; then
   sed -i -e "s/@MARK64@//" Makefile.am
   sed -i -e "s/@MARK64@//" Makefile.in
  fi

  # fix from BLFS
  sed -i -e "/*origOptString ==/c 0)" popt.c

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
