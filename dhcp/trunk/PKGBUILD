# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=dhcp
pkgver=3.1.0
pkgrel=1
pkgdesc="A DHCP server, client, and relay agent"
arch=(i686 x86_64)
license=('custom:isc-dhcp')
url="http://www.isc.org/sw/dhcp/"
depends=('glibc')
backup=('etc/dhcpd.conf' 'etc/dhclient.conf')
install=dhcp.install
source=(ftp://ftp.isc.org/isc/dhcp/dhcp-$pkgver.tar.gz dhcp-3.0.3-tr.c.patch \
        dhcpd)
md5sums=('27d179a3c3fbef576566b456a1168246'
         '39866416303b674df08b66b2d094e523'
	 '025b8fe98b6c0814428b671b1819a810')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i ../dhcp-3.0.3-tr.c.patch || return 1
  ./configure
  make || return 1
  make DESTDIR=$startdir/pkg INCDIR=/usr/include LIBDIR=/usr/lib install
  install -D -m644 server/dhcpd.conf $startdir/pkg/etc/dhcpd.conf
  #install -D -m644 client/dhclient.conf $startdir/pkg/etc/dhclient.conf
  install -D -m755 ../dhcpd $startdir/pkg/etc/rc.d/dhcpd
  touch $startdir/pkg/var/state/dhcp/dhcpd.leases
  chmod -R 644 $startdir/pkg/usr/man/*
  chmod 755 $startdir/pkg/usr/man/man{1,3,5,8}
  #sed -i 's|etc/dhclient-script|sbin/dhclient-script|g' \
  #$startdir/pkg/etc/dhclient.conf
  rm -f $startdir/pkg/var/state/dhcp/dhcpd.leases
  rm -f ${startdir}/pkg/sbin/{dhclient,dhclient-script}
  rm -f ${startdir}/pkg/usr/man/man{5,8}/dhclient*
  # install licenses
  install -m644 -D $startdir/src/$pkgname-$pkgver/LICENSE \
                     $startdir/pkg/usr/share/licenses/dhcp/LICENSE
}
