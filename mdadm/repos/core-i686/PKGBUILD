# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=mdadm
pkgver=2.6.4
pkgrel=1
pkgdesc="A tool for managing/monitoring Linux md device arrays, also known as Software RAID"
arch=(i686 x86_64)
license=('GPL')
url="http://www.cse.unsw.edu.au/~neilb/source/mdadm/"
groups=('base')
depends=('glibc')
backup=('etc/mdadm.conf')
source=(ftp://ftp.kernel.org/pub/linux/utils/raid/mdadm/mdadm-$pkgver.tar.bz2 \
        mdadm mdadm.conf raid-partitions_install raid-partitions_hook)
replaces=('raidtools')
md5sums=('b616697aecc870d5d580bd6e010472a3'
         '6df172c8f77b280018cf87eb3d313f29'
	 '0ce4c0f9770bf582a71228053566359d'
	 '9de7e423ec9c6766b5f5d39915929003'
	 '09d72c714b40b6fa1e8eab04c1dabd42')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make INSTALL=/bin/install DESTDIR=$startdir/pkg install
  install -D -m644 ../mdadm.conf $startdir/pkg/etc/mdadm.conf
  install -D -m755 ../mdadm $startdir/pkg/etc/rc.d/mdadm
  install -D -m644 ../raid-partitions_install $startdir/pkg/lib/initcpio/install/raid-partitions
  install -D -m644 ../raid-partitions_hook $startdir/pkg/lib/initcpio/hooks/raid-partitions
  # a static binary is required for Arch's initrd
  rm mdadm
  make LDFLAGS+=-static || return 1
  install -D -m755 mdadm $startdir/pkg/sbin/mdadm.static
}
