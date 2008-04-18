# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=vpnc
pkgver=0.5.1
pkgrel=2
pkgdesc="VPN client for cisco3000 VPN Concentrators"
url="http://www.unix-ag.uni-kl.de/~massar/vpnc/"
license=('GPL')
depends=('libgcrypt' 'openssl' 'iproute')
arch=('i686' 'x86_64')
source=(http://www.unix-ag.uni-kl.de/~massar/vpnc/$pkgname-$pkgver.tar.gz
        vpnc.conf vpnc.rc)
backup=(etc/vpnc/default.conf)
md5sums=('7a8e94dbe94f39a4fd89b72e0125f66f'
         'a3f4e0cc682f437e310a1c86ae198e45'
         'c5885162ac198eaa36da9a01e7c0c55b')

build() {
  cd $startdir/src/$pkgname-$pkgver

  # Build hybrid support
  sed -i 's|^#OPENSSL|OPENSSL|g' Makefile

  make PREFIX=/usr || return 1
  make DESTDIR=$startdir/pkg PREFIX=/usr install

  install -D -m644 $startdir/src/vpnc.conf $startdir/pkg/etc/vpnc/default.conf
  install -D -m755 $startdir/src/vpnc.rc $startdir/pkg/etc/rc.d/vpnc
  rm -f $startdir/pkg/etc/vpnc/vpnc.conf
}
