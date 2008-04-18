# $Id$
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: damir <damir@archlinux.org>
pkgname=atitvout
pkgver=0.4
pkgrel=1
pkgdesc="Gives access to the TV-Out-Port on ATI-cards."
url="http://www.stud.uni-hamburg.de/users/lennart/projects/atitvout/"
depends=('glibc')
conflicts=()
backup=()
install=
source=(http://www.stud.uni-hamburg.de/users/lennart/projects/atitvout/$pkgname-$pkgver.tar.gz)
md5sums=('f2915a435844aadcd4d8f9f62411283b')

build() {
  cd $startdir/src/$pkgname
  mkdir $startdir/pkg/usr
  mkdir $startdir/pkg/usr/sbin
  make || return 1
  cp $startdir/src/$pkgname/$pkgname $startdir/pkg/usr/sbin
}
