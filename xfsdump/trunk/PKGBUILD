# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=xfsdump
pkgver=2.2.46
pkgrel=3
pkgdesc="Additional XFS filesystem utilities"
arch=(i686 x86_64)
license=('LGPL')
url="http://oss.sgi.com/projects/xfs/"
depends=('xfsprogs>=2.9.4' 'attr>=2.4.39' 'acl>=2.2.45' 'dmapi')
options=('!makeflags')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsdump_$pkgver-1.tar.gz)
md5sums=('c233a3f032d183d5bfa5dce210a08418')
options=(!emptydirs)

build() {
  cd $startdir/src/xfsdump-$pkgver
  autoconf
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  # fixes
  rm -f $startdir/pkg/usr/lib/*.la
  rm -f $startdir/pkg/usr/bin/{xfsdump,xfsrestore}
  # these are provided by the man-pages package
  rm -f $startdir/pkg/usr/man/man2/f{getxattr,listxattr,removexattr,setxattr}.2.gz
  rm -f $startdir/pkg/usr/man/man2/l{getxattr,listxattr,removexattr,setxattr}.2.gz
  rm -f $startdir/pkg/usr/man/man2/getxattr.2.gz
  rm -f $startdir/pkg/usr/man/man2/listxattr.2.gz
  rm -f $startdir/pkg/usr/man/man2/removexattr.2.gz
  rm -f $startdir/pkg/usr/man/man2/setxattr.2.gz
}
