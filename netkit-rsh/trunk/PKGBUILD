# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=netkit-rsh
pkgver=0.17
pkgrel=2
pkgdesc="This is netkit-rsh for Linux"
depends=('glibc' 'xinetd' 'pam')
source=(ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/$pkgname-$pkgver.tar.gz rsh.xinetd)
url="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
md5sums=('65f5f28e2fe22d9ad8b17bb9a10df096' '8cdb2bd41c397df90364c9d3a903dcb6')

build() {
   cd $startdir/src/$pkgname-$pkgver
   mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/man/man8 $startdir/pkg/usr/man/man1 \
            $startdir/pkg/usr/sbin $startdir/pkg/etc/xinetd.d
   ./configure --prefix=$startdir/pkg/usr
   make || return 1
   make DESTDIR=$startdir/pkg install
   install -m644 $startdir/src/rsh.xinetd $startdir/pkg/etc/xinetd.d/rsh
}
