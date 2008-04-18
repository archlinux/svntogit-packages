# $Id$
# Maintainer: damir <damir.archlinux.org>
# Contributor: Björn Martensen <bjoern.martensen@gmail.com>

pkgname=thinkfinger
pkgver=0.3
pkgrel=1
pkgdesc="ThinkFinger is a driver for the SGS Thomson Microelectronics fingerprint reader found in most IBM/Lenovo ThinkPads"
url="http://thinkfinger.sourceforge.net/"
arch=('i686' 'x86_64')
license=("GPL")
depends=('pam' 'libusb')
install=thinkfinger.install
makedepends=()
options=('!libtool')
source=(http://downloads.sourceforge.net/thinkfinger/$pkgname-$pkgver.tar.gz)
md5sums=('588565233bcbea5ff0a7f5314361c380')

build() {
  # create dir to store fingerprints
  mkdir -p $startdir/pkg/etc/pam_thinkfinger
  
  cd $startdir/src/$pkgname-$pkgver
  ./configure 	--prefix=/usr \
  		--with-securedir=/lib/security \
		--with-birdir=/etc/pam_thinkfinger
  make || return 1
  make DESTDIR=$startdir/pkg install
}

