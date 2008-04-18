# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Maintainer: Thomas Baechler <thomas@archlinux.org>

###
### NOTE: Do not build this package with anything except gcc - using ccache
###  forces others to use it as well as it becomes hardcoded in the klibc
###  script.
###

pkgname=klibc
pkgver=1.5
_klibcbranch=Stable #Stable/Testing
_kver=2.6.24-ARCH
pkgrel=5
pkgdesc="a minimal libc made for early-userspace"
arch=(i686 x86_64)
url="http://www.kernel.org/pub/linux/libs/klibc/"
license=('BSD')
groups=('base')
options=(!ccache !strip)
source=(http://www.kernel.org/pub/linux/libs/klibc/$_klibcbranch/$pkgname-$pkgver.tar.gz
        multiple_raid_assembly_fix.patch
        klibc-compile-shared-by-default.patch
        klibc-module-init-tools.patch
        klibc-2.6.24.patch)
md5sums=('d55ce89c0656a7d6896ec0b2af07b5dc'
         '8d257d50a4554d57b8f461c6a87a2877'
         'c263a7c3fd290fcc84a4e230d456d022'
         '4d78311ebce63f2fbb711f8518e71839'
         'a98b3e96aff53339572ed0bdccc8aed2')
                  
build()
{
  cd $startdir/src/$pkgname-$pkgver
  #INI_DEBUG causes ipconfig to fail within kinit
  sed -i "/#define INI_DEBUG/d" usr/kinit/kinit.h
  ln -sf /usr/src/linux-${_kver} linux

  patch -p1 -i ../multiple_raid_assembly_fix.patch || return 1
  # make klibc-module-init-tools compile
  # don't build insmod
  patch -p1 -i ../klibc-module-init-tools.patch || return 1
  # compile binaries shared by default
  patch -p1 -i ../klibc-compile-shared-by-default.patch
  # fix compilation on 2.6.24
  patch -p1 -i ../klibc-2.6.24.patch || return 1
  make EXTRA_KLIBCFLAGS='' || return 1
  make INSTALLROOT=$startdir/pkg install
  #simplify
  mv $startdir/pkg/usr/lib/klibc/bin/sh.shared $startdir/pkg/usr/lib/klibc/bin/sh
  mv $startdir/pkg/usr/lib/klibc/bin/kinit.shared $startdir/pkg/usr/lib/klibc/bin/kinit
  rm $startdir/pkg/usr/lib/klibc/bin/mknod
  rm $startdir/pkg/usr/lib/klibc/bin/kill
  ln -sf asm-x86 $startdir/pkg/usr/lib/klibc/include/asm
}
