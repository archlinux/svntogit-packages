# $Id$
# Contributor: Paul Mattal <paul@mattal.com>
# Maintainer: Paul Mattal <pjmattal@elys.com>
pkgname=aufs-utils
pkgver=20080210
pkgrel=1
_kernver='2.6.24-ARCH'
pkgdesc="Another Unionfs Implementation that supports NFS branches"
arch=('i686' 'x86_64')
url="http://aufs.sourceforge.net/"
license=('GPL2')
depends=('glibc')
source=(ftp://ftp.archlinux.org/other/aufs-new/aufs-$pkgver.tar.gz)
md5sums=('b365da56879f24ee6234672921a5f820')

build() {
  cd $startdir/src/aufs || return 1

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
  install -D -m755 util/aufind.sh $startdir/pkg/usr/bin/aufind.sh || return 1
  install -D -m755 util/aulchown $startdir/pkg/usr/bin/aulchown || return 1
  install -D -m755 util/auplink $startdir/pkg/usr/bin/auplink || return 1
  install -D -m755 util/mount.aufs $startdir/pkg/sbin/mount.aufs || return 1
  install -D -m755 util/umount.aufs $startdir/pkg/sbin/umount.aufs || return 1
}

# vim:set ts=2 sw=2 et:
