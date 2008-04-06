# Contributor: Mark Nikkel <mnikkel@gmail.com>
arch=(i686 x86_64)
pkgname=pptpclient 
pkgver=1.7.1
pkgrel=3
pkgdesc="Client for the proprietary Microsoft Point-to-Point Tunneling Protocol, PPTP."
url="http://pptpclient.sourceforge.net/"
license="GPL"
depends=(glibc ppp)
backup=(etc/ppp/{options.pptp})
source=(http://dl.sourceforge.net/sourceforge/pptpclient/pptp-$pkgver.tar.gz)
md5sums=('b47735ba5d6d37dfdbccb85afc044ede')
 
build() { 
  cd $startdir/src/pptp-$pkgver
  sed -i '/CFLAGS/d' Makefile
  make || return 1
  make DESTDIR=$startdir/pkg install
}
