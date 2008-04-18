# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=netkit-telnet
pkgver=0.17
pkgrel=7
pkgdesc="A telnet client (and server)"
arch=(i686 x86_64)
depends=('ncurses')
source=(ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/$pkgname-$pkgver.tar.gz $pkgname-$pkgver.patch telnet.xinetd)
md5sums=('d6beabaaf53fe6e382c42ce3faa05a36' 'd56497f2c6b96e8909ed57f1be19411d' \
         'c6e6ca4ba8e084be8ce2a170bebc17cc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../$pkgname-$pkgver.patch
  ./configure --prefix=/usr --installroot=$startdir/pkg
  make || return 1
  mkdir -p $startdir/pkg/usr/{bin,sbin,man/man1,man/man5,man/man8} $startdir/pkg/etc/xinetd.d
  make install
  install -m644 $startdir/src/telnet.xinetd $startdir/pkg/etc/xinetd.d/telnet
}
