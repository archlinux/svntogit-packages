# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=knockd
pkgver=0.5
pkgrel=5
pkgdesc="A simple port-knocking daemon"
arch=(i686 x86_64)
url="http://www.zeroflux.org/knock/"
license=(GPL)
depends=('libpcap>=0.9.8')
backup=('etc/knockd.conf')
source=(http://www.zeroflux.org/knock/files/knock-$pkgver.tar.gz
        knockd knockd.logrotate)
md5sums=('ca09d61458974cff90a700aba6120891'
         '72302d899887996694586c3d479de245'
         '56a4113ec89ba2e96f79ab23c914d52a')

build() {
  cd $startdir/src/knock-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 ../knockd $startdir/pkg/etc/rc.d/knockd
  install -D -m644 ../knockd.logrotate $startdir/pkg/etc/logrotate.d/knockd
}
