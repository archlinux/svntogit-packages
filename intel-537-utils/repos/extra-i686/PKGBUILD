# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=intel-537-utils
pkgver=2.60.80.0
pkgrel=28
pkgdesc="Userspace tools for Intel Modem Drivers for 537 chipsets."
arch=(i686)
license=('custom:"INTEL537"')
url="http://linmodems.technion.ac.il/packages/Intel/"
depends=('bash' 'udev')
source=(http://downloadmirror.intel.com/9284/eng/Intel-537EP-2.70.95.0-suse9.3.tgz intel-537.rc.d)

build() {
  cd $startdir/src/Intel-537
  # Install driver loader
  install -D -m 755 hamregistry $startdir/pkg/usr/sbin/hamregistry
  # Install daemon
  install -D -m 755 $startdir/src/intel-537.rc.d $startdir/pkg/etc/rc.d/intel-537
  # install modem udev rule
  mkdir -p $startdir/pkg/etc/udev/rules.d
  echo 'KERNEL=="537[a-z][a-z,0-9]", MODE="0660", GROUP="tty", SYMLINK+="modem", RUN+="/lib/udev/load-modules.sh ppp-generic"' > $startdir/pkg/etc/udev/rules.d/intel537.rules
 }
md5sums=('1740a05c0ce039633f2dd65b055604b0' '2ecaa11c40bd602941b39f61468eec2b')
