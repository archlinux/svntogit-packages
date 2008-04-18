# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=udev
pkgver=119
pkgrel=1
pkgdesc="The userspace dev tools (udev)"
arch=(i686 x86_64)
url="http://www.kernel.org/pub/linux/utils/kernel/hotplug/udev.html"
license=('GPL')
groups=('base')
depends=('glibc' 'coreutils' 'util-linux')
install=udev.install
backup=(etc/udev/udev.conf
        etc/scsi_id.config
        etc/udev/cdsymlinks.conf
        etc/modprobe.d/framebuffer_blacklist)
conflicts=('pcmcia-cs' 'hotplug')
replaces=('devfsd')
options=(!makeflags)
source=(http://www.kernel.org/pub/linux/utils/kernel/hotplug/$pkgname-$pkgver.tar.bz2
        migrate-udev start_udev 51-arch.rules load-modules.sh 
        cdrom-rules.patch cdsymlinks.sh root-link.sh readme-udev-arch.txt arch-udev-rules.patch)
md5sums=('dd299c16371c9e14e52d79744bccf4c0'
         '49434a593918c822077bc3af765f1aff'
         'a68a519d1ed8cbbd2f45c23eb32ea218'
         '082e76ef9053495a5cade321817467cd'
         '945f6d30ab458189b3c17f8e6722da1f'
         '5de33ba31ce52ab4da47fe3ddd3c19ea'
         '8424b78e9dd772e75b4ef90814807815'
         '2d6dc6842464f107bccc68cd505a6c31'
         '780db5316a762dc5cdcf52027ab8a8eb'
         'fab7fa68aa35f0595c0b2bd88c4dbfd9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  make INSTALL=/bin/install DESTDIR=$startdir/pkg install \
    EXTRAS="extras/ata_id extras/cdrom_id extras/edd_id extras/firmware extras/floppy extras/scsi_id extras/usb_id extras/volume_id extras/path_id extras/rule_generator"

  install -D -m755 extras/path_id/path_id $startdir/pkg/sbin/path_id
  install -D -m755 $startdir/src/start_udev $startdir/pkg/etc/start_udev
  install -D -m755 $startdir/src/migrate-udev $startdir/pkg/sbin/migrate-udev
  install -D -m644 $startdir/src/51-arch.rules $startdir/pkg/etc/udev/rules.d/51-arch.rules
  # install our module loading subsystem
  install -D -m755 $startdir/src/load-modules.sh $startdir/pkg/lib/udev/load-modules.sh
  # install cdsymlinks.sh
  install -D -m755 $startdir/src/cdsymlinks.sh $startdir/pkg/lib/udev/cdsymlinks.sh
  # install root-link.sh
  install -D -m755 $startdir/src/root-link.sh $startdir/pkg/lib/udev/root-link.sh
  # install instructions
  install -D -m644 $startdir/src/readme-udev-arch.txt $startdir/pkg/etc/udev/readme-udev-arch.txt
  # add devices dir
  mkdir $startdir/pkg/lib/udev/devices
  # disable error loggin to prevent startup failures printed to vc on boot
  sed -i -e 's|udev_log="err"|udev_log="0"|g' $startdir/pkg/etc/udev/udev.conf
  # install additional rules files
  install -D -m 644 $startdir/src/$pkgname-$pkgver/etc/udev/packages/40-pilot-links.rules $startdir/pkg/etc/udev/rules.d/
  install -D -m 644 $startdir/src/$pkgname-$pkgver/etc/udev/packages/64-device-mapper.rules $startdir/pkg/etc/udev/rules.d/
  install -D -m 644 $startdir/src/$pkgname-$pkgver/etc/udev/packages/64-md-raid.rules $startdir/pkg/etc/udev/rules.d/
  # fix 60-cdrom_id.rules
  cd $startdir/pkg/etc/udev/rules.d/
  patch -Np0 -i $startdir/src/cdrom-rules.patch || return 1
  # fix standard udev rules to fit to arch
  patch -Np0 -i $startdir/src/arch-udev-rules.patch || return 1
  # fix program paths in rules files
  for i in vol_id cdrom_id ata_id scsi_id path_id edd_id usb_id; do
	sed -i -e "s#$i#/lib/udev/$i#g" $startdir/pkg/etc/udev/rules.d/*
  done
  # fix modprobe rules to use the load-modules.sh
  sed -i -e "s#/sbin/modprobe#/lib/udev/load-modules.sh#g" $startdir/pkg/etc/udev/rules.d/*
  # disable persistent cdromsymlinks and network by default
  mv $startdir/pkg/etc/udev/rules.d/75-persistent-net-generator.rules \
     $startdir/pkg/etc/udev/rules.d/75-persistent-net-generator.rules.optional
  mv $startdir/pkg/etc/udev/rules.d/75-cd-aliases-generator.rules \
     $startdir/pkg/etc/udev/rules.d/75-cd-aliases-generator.rules.optional
  # create framebuffer blacklist
  mkdir -p $startdir/pkg/etc/modprobe.d/
  for mod in $(find /lib/modules/ -name '*fb*.ko' -exec basename {} .ko \;); do 
	echo "blacklist $mod" >> $startdir/pkg/etc/modprobe.d/framebuffer_blacklist
  done
}
