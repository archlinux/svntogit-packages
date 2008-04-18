# $Id$
# Maintainer: Mark Rosenstand <mark@archlinux.org>
pkgname=fuse
pkgver=2.7.3
pkgrel=1
pkgdesc="A library that makes it possible to implement a filesystem in a userspace program."
arch=(i686 x86_64)
url="http://fuse.sourceforge.net/"
license="GPL2"
depends=('glibc')
makedepends=('pkgconfig')
install=fuse.install
source=(http://mesh.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
options=(!libtool)
md5sums=('98563fc7b265b7479a3178181cbcf59a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-kernel-module --enable-lib \
              --enable-util --bindir=/bin
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # static device nodes will cause collision.
  rm -rf $startdir/pkg/dev
  # Remove init script in wrong path
  # Don't add our own for now, as fusectl fs oopses on 2.6.18
  rm -rf $startdir/pkg/etc/init.d
  #install -D -m755 $startdir/src/fuse.rc.d $startdir/pkg/etc/rc.d/fuse

  mkdir -p $startdir/pkg/lib
  mv $startdir/pkg/usr/lib/libfuse.so.${pkgver} $startdir/pkg/lib/ || return 1
  ln -s ../../lib/libfuse.so.${pkgver} $startdir/pkg/usr/lib/libfuse.so.${pkgver} || return 1
  ln -s libfuse.so.${pkgver} $startdir/pkg/lib/libfuse.so.2 || return 1
  mv $startdir/pkg/usr/lib/libulockmgr.so.1.0.1 $startdir/pkg/lib/ || return 1
  ln -s ../../lib/libulockmgr.so.1.0.1 $startdir/pkg/usr/lib/libulockmgr.so.1.0.1 || return 1
  ln -s libulockmgr.so.1.0.1 $startdir/pkg/lib/libulockmgr.so.1 || return 1
}
