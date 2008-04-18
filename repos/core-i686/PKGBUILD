# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
pkgname=dmapi
pkgver=2.2.8
pkgrel=3
pkgdesc="Data migration API"
arch=(i686 x86_64)
url="http://oss.sgi.com/projects/xfs/"
license=('GPL')
groups=('base')
depends=('glibc')
makedepends=('xfsprogs')
provides=('xfsdmapi')
conflicts=('xfsdmapi')
replaces=('xfsdmapi')
options=('!libtool')
source=(ftp://oss.sgi.com/projects/xfs/cmd_tars/dmapi_$pkgver-1.tar.gz)
md5sums=('1265828fabc6e3ec4b70696db331fb8a')

build() {
  cd $startdir/src/dmapi-$pkgver
  [ "$CARCH" = "x86_64" ] && export CFLAGS="$CLFAGS -fPIC"
  autoconf
  ./configure --prefix=$startdir/pkg/usr
  make || return 1 
  make prefix=$startdir/pkg/usr/ install install-lib install-dev
  # the static lib
  install -D -m644 libdm/.libs/libdm.a $startdir/pkg/usr/lib/libdm.a
  # and the header file, please
  install -D -m644 include/dmapi.h $startdir/pkg/usr/include/xfs/dmapi.h
}
