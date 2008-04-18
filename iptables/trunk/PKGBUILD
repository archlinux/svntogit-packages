# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
pkgname=iptables
pkgver=1.4.0
pkgrel=2
pkgdesc="A Linux kernel packet control tool"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.netfilter.org/"
depends=('glibc')
source=(http://www.iptables.org/projects/iptables/files/iptables-$pkgver.tar.bz2 \
        iptables ip6tables empty.rules simple_firewall.rules iptables.conf.d)
md5sums=('90cfa8a554a29b0b859a625e701af2a7'
         '89401d6f0cf1de46a455b7be6720a58b'
         '6e0e88c2ed0c3715d1409ee3258a0046'
         '14186bbafe21bb0638c0cb8e0903c829'
         'e53a83bb4d8ac8b7eadd7bd58294751d'
         'c7cf6e4455c228e50d20ce3edd75ee59')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's|/usr/local|/usr|' Makefile
  sed -i 's|MANDIR:=$(PREFIX)/man|MANDIR:=$(PREFIX)/share/man|' Makefile
  # this seems to cause more problems than help
  # sed -i "s:/usr/src/linux:/usr/src/linux\*:" Makefile
  make KERNEL_DIR=/usr/src/linux-$(uname -r) || return 1
  make KERNEL_DIR=/usr/src/linux-$(uname -r) experimental || return 1
  make PREFIX=$startdir/pkg/usr KERNEL_DIR=/usr/src/linux-$(uname -r) install || return 1
  make PREFIX=$startdir/pkg/usr KERNEL_DIR=/usr/src/linux-$(uname -r) install-devel || return 1
  make PREFIX=$startdir/pkg/usr KERNEL_DIR=/usr/src/linux-$(uname -r) install-experimental || return 1
  install -D -m755 ../iptables $startdir/pkg/etc/rc.d/iptables
  install -D -m755 ../ip6tables $startdir/pkg/etc/rc.d/ip6tables
  install -D -m644 ../empty.rules $startdir/pkg/etc/iptables/empty.rules
  install -D -m644 ../simple_firewall.rules $startdir/pkg/etc/iptables/simple_firewall.rules
  install -D -m644 ../iptables.conf.d $startdir/pkg/etc/conf.d/iptables
}
