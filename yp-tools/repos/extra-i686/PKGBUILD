# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=yp-tools
pkgver=2.10
pkgrel=1
pkgdesc="yp-tools is an implementation of the NIS client tools for Linux"
arch=(i686 x86_64)
depends=('ypbind-mt' 'glibc')
source=(ftp://ftp.kernel.org/pub/linux/utils/net/NIS/$pkgname-$pkgver.tar.gz)
url="http://www.linux-nis.org/nis/yp-tools/"
md5sums=('d3e3df89148f0db3dabcd220c6255405')

build() {
  cd $startdir/src/$pkgname-$pkgver
  # the domainname utilities are provided by net-tools
  ./configure --prefix=/usr --disable-domainname
  make || return 1
  make DESTDIR=$startdir/pkg install
}
