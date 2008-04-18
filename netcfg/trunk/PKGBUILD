# $Id$
# Maintainer: James Rayner <james@archlinux.org>
pkgname=netcfg
pkgver=2.0.6
pkgrel=1
pkgdesc="Network configuration and profile scripts"
url="http://archlinux.org"
license=("BSD")
backup=(etc/iftab)
depends=(wireless_tools wpa_supplicant net-tools mktemp)
source=(http://dev.archlinux.org/~james/netcfg/netcfg-$pkgver.tar.gz)
md5sums=('8bf6861e800a5b35f9f8ee4db8e07151')
#source=(netcfg-$pkgver.tar.gz)
arch=(i686 x86_64)

build() {
  cd $startdir/src/netcfg-$pkgver
  sed -i 's|/man/|/share/man/|' Makefile
  make DESTDIR=$startdir/pkg install
  make DESTDIR=$startdir/pkg install-contrib
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/netcfg/LICENSE
 
  # Uncomment once initscripts patch merged
  # ln -s /usr/bin/netcfg2 $startdir/pkg/usr/bin/netcfg 
}
