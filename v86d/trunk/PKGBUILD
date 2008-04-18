# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname="v86d"
pkgver=0.1.3
pkgrel=3.1
pkgdesc="userspace helper for uvesafb that runs x86 code in an emulated environment"
url="http://dev.gentoo.org/~spock/projects/uvesafb/"
license=('GPL2')
arch=("i686" "x86_64")
makedepends=('kernel26>=2.6.24' 'kernel26<2.6.25')
depends=('glibc' 'klibc>=1.5-4')
_kernver="2.6.24-ARCH"
backup=(etc/modprobe.d/uvesafb)
source=(http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-$pkgver.tar.bz2
        v86d
        v86d_hook
        modprobe.uvesafb)
md5sums=('1c26f40af343bcc465f5832e2c9548d6'
         '4370f3c903fb005df0274b46ba4318e2'
         '813958b8f6c75a7063e4858f31509694'
         '33da6a93ce1b94c841836831e85d3b00')
options=(!makeflags)

build() {
  cd $startdir/src/v86d-$pkgver

  sed 's|-static||g' -i Makefile

  ./configure --with-klibc
  make KDIR=/lib/modules/${_kernver}/build || return 1
  make DESTDIR=$startdir/pkg install || return 1
  mv $startdir/pkg/sbin/v86d $startdir/pkg/sbin/v86d_klibc

  make clean

  ./configure --default
  make KDIR=/lib/modules/${_kernver}/build || return 1
  make DESTDIR=$startdir/pkg install || return 1

  install -D -m644 $startdir/src/v86d $startdir/pkg/lib/initcpio/install/v86d || return 1
  install -D -m644 $startdir/src/v86d_hook $startdir/pkg/lib/initcpio/hooks/v86d || return 1
  install -D -m644 $startdir/src/modprobe.uvesafb $startdir/pkg/etc/modprobe.d/uvesafb || return 1
}
