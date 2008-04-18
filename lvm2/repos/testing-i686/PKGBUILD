# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=lvm2
pkgver=2.02.34
pkgrel=1
pkgdesc="Logical Volume Manager 2 utilities"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceware.org/lvm2/"
groups=('base')
depends=('device-mapper>=1.02.22')
conflicts=('lvm')
backup=('etc/lvm/lvm.conf')
source=(ftp://sources.redhat.com/pub/lvm2/LVM2.$pkgver.tgz
        lvm2_install
        lvm2_hook)
md5sums=('f71c0f63df887ae1b39b15a63d405de2'
         '40dccdb1044f00fc1e29ca549933d4bd'
	 '73c8c2eba0fe891712c859c18b5b8aa2')

build() {
  cd $startdir/src/LVM2.$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc  --localstatedir=/var
  make || return 1
  make DESTDIR=$startdir/pkg sbindir=$startdir/pkg/sbin install || return 1
  mkdir -p $startdir/pkg/etc/lvm/{archive,backup}
  # a static binary is required for Arch's initrd
  ./configure --prefix=/usr --sysconfdir=/etc  --localstatedir=/var \
    --enable-static_link
  make || return 1
  install -D -m755 tools/lvm.static $startdir/pkg/sbin/lvm.static
  # add hook
  install -D -m644 $startdir/src/lvm2_hook $startdir/pkg/lib/initcpio/hooks/lvm2
  install -D -m644 $startdir/src/lvm2_install $startdir/pkg/lib/initcpio/install/lvm2
}
