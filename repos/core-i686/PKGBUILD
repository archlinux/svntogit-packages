# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=acl
pkgver=2.2.47
pkgrel=1
pkgdesc="Library for filesystem ACL support"
arch=(i686 x86_64)
url="http://oss.sgi.com/projects/xfs/"
license=('LGPL')
groups=('base')
depends=('attr>=2.4.41')
replaces=('xfsacl')
provides=('xfsacl')
conflicts=('xfsacl')
options=('!libtool')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/acl_${pkgver}-1.tar.gz)
md5sums=('a11e4571a54a0b1ae83010d1e68a64c2')

build() {
  cd $startdir/src/acl-$pkgver 
  autoconf
  ./configure --prefix=$startdir/pkg/usr
  make || return 1 
  make prefix=$startdir/pkg/usr/ install install-lib install-dev

  # tidy up
  cd $startdir/pkg

  mkdir -v lib
  mv -v usr/lib/libacl.so* lib/
  ln -sv ../../lib/libacl.so.1 usr/lib/libacl.so

  mv -v usr/libexec/libacl.{a,la} usr/lib/
  rm -rf $startdir/pkg/usr/libexec
}
