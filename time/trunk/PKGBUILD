# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: 

pkgname=time
pkgver=1.7
pkgrel=1
pkgdesc="The 'time' command runs another program, then displays information about the resources used by that program, collected by the system while the program was running."
url="http://www.gnu.org/software/time/time.html"
depends=('glibc')
source=("http://ftp.gnu.org/pub/gnu/time/time-$pkgver.tar.gz")
md5sums=('e38d2b8b34b1ca259cf7b053caac32b3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=$startdir/pkg/usr
  make || return 1
  make install
  ln -sf /usr/bin/time $startdir/pkg/usr/bin/gnutime
}
