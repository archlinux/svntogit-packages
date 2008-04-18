# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=sysfsutils
pkgver=2.1.0
pkgrel=4
pkgdesc="System Utilities Based on Sysfs"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://linux-diag.sourceforge.net/Sysfsutils.html"
groups=('base')
depends=('glibc')
source=(http://downloads.sourceforge.net/sourceforge/linux-diag/$pkgname-$pkgver.tar.gz)
md5sums=('14e7dcd0436d2f49aa403f67e1ef7ddc')


build() {
  cd $startdir/src/$pkgname-$pkgver 
  ./configure --prefix=/usr 
  make || return 1 
  make DESTDIR=$startdir/pkg/ install

  cd "$startdir"/pkg
  mkdir -v lib
  mv -v usr/lib/libsysfs.so.2* lib/
  ln -svf ../../lib/libsysfs.so.2 usr/lib/libsysfs.so
 
  #libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}

