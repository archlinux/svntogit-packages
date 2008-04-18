# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=evms
pkgver=2.5.5
pkgrel=5
pkgdesc="Enterprise Volume Management System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://evms.sourceforge.net/"
depends=('device-mapper>=1.02.19' 'e2fsprogs' 'perl')
optdepends=('gtk' 'glib')
makedepends=('gtk')
backup=('etc/evms.conf')
source=(http://downloads.sourceforge.net/sourceforge/evms/evms-$pkgver.tar.gz
	# patches from evms homepage
	http://evms.sourceforge.net/patches/2.5.5/engine/md_super_fix.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/ntfs_unmkfs.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/raid5_degrade_fix.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/raid5_remove_spare_fix_2.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/raid5_algorithm.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/cli_reload_options.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/cli_query_segfault.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/BaseName.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/get_geometry.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/s390_ioctl_fix.patch
	http://evms.sourceforge.net/patches/2.5.5/engine/disk_cache.patch
	evms_hook evms_install)
install=evms.install
md5sums=('45b463f0cbade194dc0a08be432b572e'
         'e48c5d6f6536b378e4f4d38e3187b8e7'
         '5c3794821a2521dbfe2e540023bcc108'
         'ec9a4d05d6d67b3f1953fb63ebb2a41e'
         'dacdaf8103d5a683f031628ff816f81b'
         '1e0739ff2aaecafd3d6355c43a1eb637'
         '9daa792a87326c97077dccd007ac9af7'
         '4d0610bd1f8b70bc477ccb2376f1a6f5'
         'e0af09fee4898e9ae63e1902f116c18a'
         '2122d3cb2374153f2569f05d14fdee13'
         'eb9d484e71ada2bbf9a94fa764c670cf'
         'a5e00a9f6f7ea6ec8a776d1cc7cb76bf'
         'c97b7918f589ecfe244ed86de5513f0a'
         '4ce62767cc2dc4fbe9f428c36e08cb79')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # adding patches from http://evms.sourceforge.net/patches/2.5.5/engine/
  PATCHES="md_super_fix.patch raid5_degrade_fix.patch raid5_remove_spare_fix_2.patch raid5_algorithm.patch cli_reload_options.patch cli_query_segfault.patch BaseName.patch get_geometry.patch s390_ioctl_fix.patch disk_cache.patch"
   for i in $PATCHES; do
   	patch -Np1 -i $startdir/src/$i || return 1
   done
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$startdir/pkg install
  # add evms hook and install file for initcpio
  install -D -m 644 $startdir/src/evms_install $startdir/pkg/lib/initcpio/install/evms
  install -D -m 644 $startdir/src/evms_hook $startdir/pkg/lib/initcpio/hooks/evms
}
