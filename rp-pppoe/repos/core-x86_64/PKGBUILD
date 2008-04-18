# $Id$
# Contributor: orelien <aurelien.foret@wanadoo.fr>
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=rp-pppoe
pkgver=3.8
pkgrel=3
pkgdesc="Roaring Penguin's Point-to-Point Protocol over Ethernet client"
arch=(i686 x86_64)
url="http://www.roaringpenguin.com/pppoe/"
license=('GPL')
groups=('base')
depends=('ppp')
options=('!makeflags')
backup=(etc/ppp/pppoe.conf etc/ppp/firewall-standalone etc/ppp/firewall-masq etc/ppp/pppoe-server-options)
source=(http://www.roaringpenguin.com/files/download/rp-pppoe-$pkgver.tar.gz adsl rp-pppoe-kernel-mode.diff ftp://ftp.samba.org/pub/ppp/ppp-2.4.4.tar.gz)
md5sums=('0e32760f498f9cde44081ee6aafc823b'
         'adace1ad441aa88dcb3db52fb7f9c97f'
         'afbb63d49156797fbbecafe27d8dfbc7'
         '183800762e266132218b204dfb428d29')

build() {
  cd $startdir/src/$pkgname-$pkgver/src
  patch -Np0 -i ../../rp-pppoe-kernel-mode.diff || return 1
  ./configure --prefix=/usr --enable-plugin=../../ppp-2.4.4
  make || return 1
  make RPM_INSTALL_ROOT=$startdir/pkg install
  install -m755 -D ../../adsl $startdir/pkg/etc/rc.d/adsl
}
