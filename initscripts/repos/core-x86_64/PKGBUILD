# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Maintainer: Aaron Griffin <aaron@archlinux.org>

pkgname=initscripts
pkgver=2008.03
pkgrel=4
pkgdesc="System initialization/bootup scripts"
arch=('i686' 'x86_64')
url="http://www.archlinux.org"
license=('GPL')
groups=('base')
backup=(etc/inittab etc/rc.conf etc/rc.local etc/rc.local.shutdown)
depends=('glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=118' 'net-tools' 'ncurses')
install=initscripts.install
source=(ftp://ftp.archlinux.org/other/initscripts/${pkgname}-${pkgver}-${pkgrel}.tar.gz)
md5sums=('1b97ca9a75902f54ffea98bc58757028')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}-${pkgrel}/
  DESTDIR=$startdir/pkg ./install.sh
}
