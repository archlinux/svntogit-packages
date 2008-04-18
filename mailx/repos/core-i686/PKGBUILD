# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=mailx
pkgver=8.1.1
pkgrel=5
pkgdesc="A commandline utility for sending email"
arch=(i686 x86_64)
url="http://www.opengroup.org/onlinepubs/007908799/xcu/mailx.html"
license=('BSD')
groups=('base')
depends=('glibc')
source=(ftp://ftp.archlinux.org/other/mailx/$pkgname-$pkgver-fixed.tar.gz \
        mailx-$pkgver.patch mailx-gcc4.patch)
md5sums=('63cad526ac64b57bcba2c0daaa1f3048' '905cfa35b5131524bfec0c677d456bd3'\
         '8716c7c7b3f5d348443230e2fe543bf6')

build() {
  cd $startdir/src/$pkgname-$pkgver-fixed
  patch -Np1 -i ../mailx-$pkgver.patch || return 1
  patch -Np0 -i ../mailx-gcc4.patch || return 1
  make all || return 1
  make DESTDIR=$startdir/pkg install
}
