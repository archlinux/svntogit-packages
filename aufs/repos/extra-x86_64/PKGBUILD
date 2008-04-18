# $Id$
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Paul Mattal <pjmattal@elys.com>
pkgname=aufs
pkgver=20080210
pkgrel=3
_kernver='2.6.24-ARCH'
pkgdesc="Another Unionfs Implementation that supports NFS branches"
arch=('i686' 'x86_64')
url="http://aufs.sourceforge.net/"
license=('GPL2')
depends=('kernel26>=2.6.24.4-1' 'kernel26<=2.6.25-0' 'glibc' 'aufs-utils')
install=$pkgname.install
source=(ftp://ftp.archlinux.org/other/aufs-new/$pkgname-$pkgver.tar.gz \
        vfs_splice.diff)
md5sums=('b365da56879f24ee6234672921a5f820'
         '2b9cd549bf5194e853c6a2d4a10856eb')
options=(!libtool !makeflags)

build() {
  cd $startdir/src/$pkgname || return 1

  # use splice functions exported by unionfs kernel patch
  patch -p1 < $startdir/src/vfs_splice.diff

  # configure for NFS by:
  # 1) configure local.mk to use FILP and LHASH
  sed -i 's|CONFIG_AUFS_PUT_FILP_PATCH =|CONFIG_AUFS_PUT_FILP_PATCH = y|' \
    local.mk || return 1
  sed -i 's|CONFIG_AUFS_LHASH_PATCH =|CONFIG_AUFS_LHASH_PATCH = y|' \
    local.mk || return 1
  # 2) configure local.mk NOT to use FAKE_DM
  sed -i 's|CONFIG_AUFS_FAKE_DM = y|CONFIG_AUFS_FAKE_DM =  |' \
    local.mk || return 1

  # build
  make KDIR=/usr/src/linux-$_kernver/ -f local.mk || return 1

  # install
  install -D -m644 fs/aufs/aufs.ko \
    $startdir/pkg/lib/modules/$_kernver/fs/aufs/aufs.ko || return 1

  # tweak the install script for the right kernel version
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
    $startdir/$pkgname.install || return 1
}

# vim:set ts=2 sw=2 et:
