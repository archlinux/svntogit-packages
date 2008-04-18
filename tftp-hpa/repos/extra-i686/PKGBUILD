# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Jose Javier  <jojapa@terra.es>
pkgname=tftp-hpa
pkgver=0.48
pkgrel=1
pkgdesc="official tftp server"
arch=(i686 x86_64)
depends=('tcp_wrappers' 'termcap-compat')
conflicts=('netkit-tftp')
source=(http://www.kernel.org/pub/software/network/tftp/$pkgname-$pkgver.tar.gz tftpd)
url="http://www.kernel.org/pub/software/network/tftp/"
md5sums=('73dd29dfa9062a174163f6a267e0b5f7'
         '9b9919cdd8ef3bccb3c3f3531054a6ed')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  mkdir -p $startdir/pkg/etc/rc.d $startdir/pkg/var/tftpboot
  cp $startdir/src/tftpd $startdir/pkg/etc/rc.d/tftpd
  rm $startdir/pkg/usr/man/man8/tftpd.8
}
