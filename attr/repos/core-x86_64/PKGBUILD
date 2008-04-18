# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=attr
pkgver=2.4.41
pkgrel=1
pkgdesc="Extended attribute support library for ACL support"
arch=(i686 x86_64)
url="http://oss.sgi.com/projects/xfs/"
license=('LGPL')
groups=('base')
depends=('glibc') 
makedepends=('gettext')
replaces=('xfsattr')
provides=('xfsattr')
conflicts=('xfsattr')
options=('!libtool')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/attr_${pkgver}-1.tar.gz)
md5sums=('867eb6e8863e39900382d77e2b538696')

build() {
  cd $startdir/src/attr-$pkgver 
  autoconf
  ./configure --prefix=/usr 
  sed -i -e 's/man2//g' man/Makefile
  make || return 1 
  make prefix=${startdir}/pkg/usr install install-lib install-dev

  # tidy up
  cd "${startdir}/pkg"

  mkdir -v lib
  mv -v usr/lib/libattr.so* lib/
  ln -sv ../../lib/libattr.so.1 usr/lib/libattr.so

  mv -v usr/libexec/libattr.{a,la} usr/lib/
  rm -rvf usr/libexec
}
